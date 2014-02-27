class SitesController < ApplicationController
  include SitesHelper

  include Yelp::V2::Search::Request

  def index
   
  end

  def create
    search_params = params.require(:query).permit(:source, :date, :searchterm, :address, :city, :state, :zipcode, :searchradius, :resultslimit)
    # If source is Resaurants...
    if search_params[:source] == "Restaurants"
      # Create the Restaurant search results
      RestaurantResult.all.each do |record|
        record.destroy
      end 

      client = Yelp::Client.new
      request = Location.new(
        term: search_params[:searchterm],
        address: search_params[:address], 
        city: search_params[:city],
        state: search_params[:state],
        zipcode: search_params[:zipcode],
        radius: search_params[:searchradius],
        limit: search_params[:resultslimit]
      )
      response = client.search(request)

      response["businesses"].each do |r|
        result = RestaurantResult.create(
          name: r["name"],
          address: r["location"]["address"].first,
          city: r["location"]["city"],
          state: r["location"]["state_code"],
          phone: r["display_phone"],
          website: r["url"],
          logo: r["image_url"],
          rating_img: r["rating_img_url"]
        )
        result.concat_full_address
        result.save
      end
      results = RestaurantResult.all

      respond_to do |f|
        f.json { render :json => results, only: [:id, :name, :full_address, :logo, :rating_img, :latitude, :longitude] }
      end

    # If source is Fund & Cheap...  
    elsif search_params[:source] == "Fun & Cheap"
      # Creat the funcheap search results
      date_obj = Date.strptime(search_params[:date], '%m/%d/%Y')
      formated_date = date_obj.strftime("%A, %B %-d, %Y")
      
      results = Funcheap.where(date: formated_date)

      respond_to do |f|
        f.json { render :json => results, only: [:id, :name, :full_address, :latitude, :longitude] }
      end
      
    end

  end
  
end
