$(function() {

  $("ul#select_source a").click(function(eventObject) {
    eventObject.preventDefault();
    if ($(this).text() === "Fun & Cheap") {
      console.log("fun & cheap, mo-fo!");
      $("input#activity_selector").val("Fun & Cheap");
      $("#restaurantForm").empty();
    }
    else if ($(this).text() === "Restaurants") {
      console.log("restaurants, mo-fo!");
      $("input#activity_selector").val("Restaurants");
      var restaurantQueryHTML = HandlebarsTemplates.restaurant_query();
      $("#restaurantForm").append(restaurantQueryHTML);
    }
    else if ($(this).text() === "Concerts") {
      console.log("concerts, mo-fo!");
      $("input#activity_selector").val("Concerts");
      $("#restaurantForm").empty();
    }
    else {
      console.log("No clue, mo-fo!");
    } 
  });

  $("#search_button").click(function(eventObject) {
    eventObject.preventDefault();
    var date = $('#itinerary_date').val();
    if ($("input#activity_selector").val() === "Restaurants") {
      console.log("searching restaurants");
      var rq = {};
      rq.date = date;
      rq.searchterm = $("#yelpfind_searchterm").val();
      rq.address = $("#yelpfind_address").val();
      rq.city = $("#yelpfind_city").val();
      rq.state = $("#yelpfind_state").val();
      rq.zipcode = $("#yelpfind_zipcode").val();
      rq.searchradius = $("#yelpfind_searchradius").val();
      rq.resultslimit = $("#yelpfind_resultslimit").val();

      $.ajax({
        url: "/wingman.json",
        type: "POST",
        data: { query: rq }
      }).done(function(data) {
        console.log(data);
        $(data).each(function(index, result) {

          // Use Handlebars to display the parameters of the "todo" in variable "data" to the html browser
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

    }

  });

});