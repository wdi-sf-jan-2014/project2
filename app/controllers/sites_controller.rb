class SitesController < ApplicationController

  def index
    @itinerary = Itinerary.new
    @restaurants = Restaurant.all
    @yelpfind = Yelpfind.new

    if RestaurantResult.all.empty?
      @results = FuncheapResult.all
    else
      @results = RestaurantResult.all
    end

    respond_to do |f|
      f.html
      f.json { render :json => @results, only: [:name, :full_address, :date, :logo, :rating_img, :latitude, :longitude] }
    end
  end

  def create
    RestaurantResult.all.each do |record|
      record.destroy
    end

    search_params = params.require(:query).permit(:searchterm, :address, :city, :state, :zipcode, :searchradius, :resultslimit)

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
    FuncheapResult.all.each do |record|
      record.destroy
    end
    @results = RestaurantResult.all

    respond_to do |f|
      f.json { render :json => @results, only: [:name, :full_address, :date, :logo, :rating_img, :latitude, :longitude] }
    end

  end
  
end
