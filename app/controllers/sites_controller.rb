class SitesController < ApplicationController

 	def index
  	@itinerary = Itinerary.new
  	@yelpfind = Yelpfind.new
  	@results = RestaurantResult.all

  end
  
end
