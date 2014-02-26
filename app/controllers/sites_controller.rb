class SitesController < ApplicationController

    def index
        @itinerary = Itinerary.new
        @restaurants = Restaurant.all
        @yelpfind = Yelpfind.new

        if RestaurantResult.all.empty?
            @results = FuncheapResult.all
        else
            @results = RestaurantResult.all
        end
    respond_to do |f|
      f.html
      f.json { render :json => @results, only: [:name, :full_address, :date, :logo, :rating_img, :latitude, :longitude] }
    end
  end
  
end
