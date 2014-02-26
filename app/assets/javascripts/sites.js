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
    // var result = $(this).closest(".result").find(".resultName").clone().appendTo("#myItinerary");
    // console.log(result);
    // $("#myItinerary").append(result + "<br/>"); 

    obj ={};

    var activity_type = $(".form-control").val();
    console.log(activity_type);

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

