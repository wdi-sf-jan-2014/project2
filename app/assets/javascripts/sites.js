// // ititiating google maps
// function initialize(){

//   var map = new google.maps.Map(document.getElementById('map-canvas'), {
//     zoom: 12,
//     center: new google.maps.LatLng(37.754, -122.435),
//   });
// }
// $(document).on('ready page:load', initialize);

// initiating datepicker functionality
$(function() {
	$("#itinerary_date").datepicker();
});


// to add an event or restaurant to itinerary
$(function(){
  $(".addToItinerary").on("click", function(event){
    event.preventDefault();

    // Del's refactored code
    var result = $(this).closest(".result").find(".resultName").clone().appendTo("#myItinerary");
    // console.log(result);

    var object ={};
    var activity_type = $(".form-control").val();
    var date = $("#itinerary_date").val();

    $.ajax({
      type: 'post',
      url: '/itineraries.json',
      data: { object: {source: activity_type, date: date} }
    }).done(function(){
      $("#myItinerary").append(result + "<br>");
    });

  });  
});


// to save itinerary to user
$(function(){
  $(".saveItinerary").on("click", function(){
    event.preventDefault();


    var newItinerary = $(".modal-body").text();
    console.log(newItinerary);

    $(".myItineraries").append(newItinerary);
  });
});

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