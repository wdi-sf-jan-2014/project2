class SitesController < ApplicationController

  def index
  	@itinerary = Itinerary.new
  	@yelpfind = Yelpfind.new
  end
  
end
