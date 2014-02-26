function initialize() {

  // Populate results list and Google Map based on user search terms
  $("#search_button").click(function(eventObject) {
    eventObject.preventDefault();
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
      console.log(rq);
    }
    else if (eq.source === "Fun & Cheap") {}

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

        // Populate Google Map with markers
        var position = new google.maps.LatLng(
          result.latitude,
          result.longitude
        );
        marker = new google.maps.Marker({
          position: position,
          map: map,
          data: {text: "<h4>"+result.name+"</h4><br /><p>"+result.full_address+"</p>"},
          title: result.name
        });
        google.maps.event.addListener(marker, 'click', function() { 
          onItemClick(event, this);
        });
      });
    });

  });

   // Define the Google Map
        var mapOptions = {
          center: new google.maps.LatLng(37.7833, 122.4167),
          zoom: 8
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
        var southWest = new google.maps.LatLng(37.708894, -122.516908);
        var northEast = new google.maps.LatLng(37.815832, -122.343358);

        var bounds = new google.maps.LatLngBounds(southWest, northEast);
          map.fitBounds(bounds);

        var lngSpan = northEast.lng() - southWest.lng();
        var latSpan = northEast.lat() - southWest.lat();

        infowindow = new google.maps.InfoWindow(); 

  function onItemClick(event, pin) { 
    var contentString = pin.data.text;
    infowindow.setContent(contentString); 
    infowindow.setPosition(pin.position); 
    infowindow.open(map);
    event.preventDefault();
  }

}
google.maps.event.addDomListener(window, 'load', initialize);