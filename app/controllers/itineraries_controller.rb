class ItinerariesController < ApplicationController

  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    new_itinerary = params.require(:itinerary).permit(:funcheaps, :restaurant)
    @itinerary = Itinerary.create(new_itinerary)
  end
end
