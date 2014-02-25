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

    var result = $(this).parent().siblings().text();
    console.log(result);

    $("#myItinerary").append(result + "<br>");

  });  
});


