class ItinerariesController < ApplicationController
  before_filter :authenticate_user!, only: [:create]

  def create
    # new_itinerary = params.require(:itinerary).permit(:date)
    record_params = params.require(:record).permit(:event_type, :date, :id)
    id = record_params[:id].to_i
    i = current_user.itineraries.create(date: record_params[:date])
    if record_params[:event_type] == "Restaurants"
      r = RestaurantResult.find(id)
      new_r = i.restaurants.create(
        name: r.name,
        address: r.address,
        city: r.city,
        state: r.state,
        full_address: r.full_address,
        phone: r.phone,
        website: r.website,
        logo: r.logo,
        rating_img: r.rating_img,
        latitude: r.latitude,
        longitude: r.longitude
      )
      
      
      respond_to do |f|
        f.json { render :json => new_r, only: [:name, :full_address] }
      end

    elsif record_params[:event_type] == "Fun & Cheap"
      funcheap = Funcheap.find(id)
      i.funcheaps << funcheap

      respond_to do |f|
        f.json { render :json => funcheap, only: [:name, :full_address] }
      end

    else
       respond_to do |f|
        f.json { render :json => "Error", status: :unprocessable_entity }
      end
      
    end
  end

end
