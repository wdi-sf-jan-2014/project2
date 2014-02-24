class YelpfindsController < ApplicationController

	include Yelp::V2::Search::Request

	def create
		RestaurantResult.all.each do |record|
			record.destroy
		end

		search_params = params.require(:yelpfind).permit(:searchterm, :address, :city, :state, :zipcode, :searchradius, :resultslimit)
		new_search = Yelpfind.create(search_params)

		client = Yelp::Client.new
		request = Location.new(
	    term: new_search.searchterm,
	    address: new_search.address, 
	    city: new_search.city,
	    state: new_search.state,
	    zipcode: new_search.zipcode,
	    radius: new_search.searchradius,
	    limit: new_search.resultslimit
	  )
	 	response = client.search(request)

	 	response["businesses"].each do |r|
	 		result = RestaurantResult.create(
	 			name: r["name"],
	 			address: r["location"]["address"].first,
	 			city: r["location"]["city"],
	 			state: r["location"]["state_code"],
	 			phone: r["display_phone"],
	 			website: r["url"],
	 			logo: r["image_url"],
	 			rating_img: r["rating_img_url"]
	 		)
	 		result.concat_full_address
	 		result.save
	 	end

	 	redirect_to wingman_path

	end

end
