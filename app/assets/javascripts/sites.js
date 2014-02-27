
var site_initialize = function() {
	// Adds calendar date picking capability
  $("#itinerary_date").datepicker();

  // Hides spinner image
  $("#spinwheel").hide();

};


$(document).on('ready page:load', site_initialize);


$(document).ready(function() {

    var flash_test = {

        exists: function() {
            return ($('#flash').length > 0);
        },

        show: function(msg) {
            var message;

            // Create the flash div if it does not exist
            if (!flash.exists()) {
                message = $('<div id="flash"></div>').prependTo('body');
            } else {
                message = $('#flash');
            }

            // Hide message when it's clicked on
            $('body').delegate('#flash', 'click', function() {
                flash.hide();
            });

            // Set the message if one was specified
            if (msg) {
                message.html(msg);
            }

            // Display the flash
            $('#flash').slideDown();

            // Clear the timeout if one is set
            clearTimeout(flash.timeout);

            // Hide the message after 5 seconds
            flash.timeout = setTimeout(function() {
                flash.hide();
            }, 5000);
        },

        hide: function() {
            // Hide the flash
            $('#flash').slideUp();

            // Clear the timeout if it exists
            if (flash.timeout) {
                clearTimeout(flash.timeout);
            }
        },

        // Flash message timeout
        timeout: null
    };

    // Display the flash message if one exists
    if (flash.exists()) {
        flash.show();
    }
});
