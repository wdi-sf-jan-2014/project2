class ItinerariesController < ApplicationController

  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    new_itinerary = params.require(:itinerary).permit(:funcheaps, :restaurants, :user_id, :date)
    @itinerary = current_user.itineraries.create(funcheaps: new_itinerary.funcheaps, restaurants: new_itinerary.restaurants, date: new_itinerary.date)
  end
end
