class ItinerariesController < ApplicationController
  before_filter :authenticate_user!, only: [:create]

  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    new_itinerary = params.require(:itinerary).permit(:activity_type, :id)
    @itinerary = current_user.itineraries.create
  end
end
