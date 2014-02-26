$(function() {

  // Populate results list and Google Map based on user search terms
  $("#search_button").click(function(eventObject) {
    eventObject.preventDefault();
    clearMarkers();
    var eq = {};
    eq.date = $('#itinerary_date').val();
    eq.source = $("input#activity_selector").val();
    if (eq.source === "Restaurants") {
      console.log("searching restaurants");
      
      eq.searchterm = $("#yelpfind_searchterm").val();
      eq.address = $("#yelpfind_address").val();
      eq.city = $("#yelpfind_city").val();
      eq.state = $("#yelpfind_state").val();
      eq.zipcode = $("#yelpfind_zipcode").val();
      eq.searchradius = $("#yelpfind_searchradius").val();
      eq.resultslimit = $("#yelpfind_resultslimit").val();
      console.log(eq);
    }
    else if (eq.source === "Fun & Cheap") {
      console.log("searching funcheaps");
    }

    $.ajax({
      url: "/wingman.json",
      type: "POST",
      data: { query: eq }
    }).done(function(data) {
      console.log(data);
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
    });

  });

});