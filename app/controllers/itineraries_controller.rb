class ItinerariesController < ApplicationController
  before_filter :authenticate_user!, only: [:create]

  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    respond_to do |f|
      f.json { render :json => @itinerary}
    end

    selected_activity = params.require(:object).permit(:source)
    activity = selected_activity.source
    new_itinerary = params.require(:itinerary).permit(:date)
    if activity == "restaurants".downcase
      @itinerary = current_user.itineraries.restaurants.create(new_itinerary)
    elsif activity == "fun & cheap".downcase
      @itinerary = current_user.itineraries.funcheaps.create(new_itinerary)
    end
  end
end
