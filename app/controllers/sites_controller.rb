class SitesController < ApplicationController

  def index
  	@itinerary = Itinerary.new
    @restaurants = Restaurant.all
  end
  
end
