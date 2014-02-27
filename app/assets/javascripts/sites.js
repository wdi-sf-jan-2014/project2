
var site_initialize = function() {
	// Adds calendar date picking capability
  $("#itinerary_date").datepicker();

  // Hides spinner image
  $("#spinwheel").hide();

};

$(document).on('ready page:load', site_initialize);



