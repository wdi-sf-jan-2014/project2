class RestaurantResult < ActiveRecord::Base

	def concat_full_address
		self.full_address = "#{address}, #{city}, #{state}"
	end

	geocoded_by :full_address
	after_validation :geocode

end
