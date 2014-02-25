class SitesController < ApplicationController

 	def index
  	@itinerary = Itinerary.new
    @restaurants = Restaurant.all
  	@yelpfind = Yelpfind.new
  	@results = RestaurantResult.all

    respond_to do |f|
      f.html
      f.json { render :json => @results, only: [:name, :full_address, :logo, :rating_img, :latitude, :longitude] }
    end
  end
  
end
