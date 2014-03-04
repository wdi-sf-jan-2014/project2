var currentItinerary = [];
var search_initialize = function() {

  // Populate results list and Google Map based on user search terms
  $("#search_button").click(function(eventObject) {
    eventObject.preventDefault();
    clearMarkers();
    var eq = {};
    eq.date = $('#itinerary_date').val();
    eq.source = $("input#activity_selector").val();
    if (eq.source === "Restaurants") {
      eq.searchterm = $("#yelpfind_searchterm").val();
      eq.address = $("#yelpfind_address").val();
      eq.city = $("#yelpfind_city").val();
      eq.state = $("#yelpfind_state").val();
      eq.zipcode = $("#yelpfind_zipcode").val();
      eq.searchradius = $("#yelpfind_searchradius").val();
      eq.resultslimit = $("#yelpfind_resultslimit").val();
    }
    else if (eq.source === "Fun & Cheap") {
    }

    $.ajax({
      url: "/wingman.json",
      type: "POST",
      data: { query: eq },
      beforeSend: function() {
        $("#spinwheel").show();
      }
    }).done(function(data) {
      $("#spinwheel").hide();
      // Clear the results list table
      $("#resultsTable").empty();

      // Define the Google Map
      // Code has been removed and placed into map.js

      // Iterate through the returned JSON object (as "data")
      $(data).each(function(index, result) {

        // Use Handlebars to display the parameters of the "result" in variable "data" to the html browser
        var resultsHTML = HandlebarsTemplates.result_list(result);
        $("#resultsTable").append(resultsHTML);
        
        // Populate the Google Map with markers from "result" object
        setMarker(result);
      });

      // Add event listener for button click and add to Itinerary
      $(".addToItinerary").on("click", function(event){
        event.preventDefault();

        var recordDetail = {};
        recordDetail.event_type = eq.source;
        recordDetail.date = eq.date;
        recordDetail.id = $(this).attr("data-id");

        $.ajax({
          url: "/itineraries.json",
          type: "POST",
          data: { record: recordDetail }
        }).done(function(data) {
          var record = {};
          record.date = eq.date;
          record.name = data.name;
          record.full_address = data.full_address;
          currentItinerary.push(record);

          // Use Handlebars to display the parameters of the "record" to the html itinerary modal
          var recordHTML = HandlebarsTemplates.view_itinerary(record);
          $("#myItinerary").append(recordHTML);
        }).fail(function() {
          window.location.href = "/users/sign_in";
        });
      });

    });
  });
};

$(document).on('ready page:load', search_initialize);

// Watching for share email button press
$(function() {
  $("#emailButton").on("click", function(event){
    event.preventDefault();
    $.ajax({
          url: "/senditineraries.json",
          type: "post",
          dataType: 'json',
          contentType: 'application/json',
          data: JSON.stringify({ records: currentItinerary })
        });
  });
});