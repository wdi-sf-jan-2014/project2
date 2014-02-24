class SitesController < ApplicationController

 	def index
  	@itinerary = Itinerary.new
    @restaurants = Restaurant.all
  	@yelpfind = Yelpfind.new
  	@results = RestaurantResult.all
  end
  
end
