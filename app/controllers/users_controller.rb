class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    @events = current_user.itineraries.sort{|event1, event2| event1[:date] <=> event2[:date]}
  end

end