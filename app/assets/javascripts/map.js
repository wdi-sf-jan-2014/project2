
function initialize() {

  var mapOptions = {
    center: new google.maps.LatLng(37.7833, 122.4167),
    zoom: 8
  };
  var map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);

  var southWest = new google.maps.LatLng(37.708894, -122.516908);
  var northEast = new google.maps.LatLng(37.815832, -122.343358);

  var bounds = new google.maps.LatLngBounds(southWest, northEast);
  map.fitBounds(bounds);

  var lngSpan = northEast.lng() - southWest.lng();
  var latSpan = northEast.lat() - southWest.lat();

  infowindow = new google.maps.InfoWindow(); 

  marker = [];

  //Get the selected date (range) - $(".dayfilter").val()
  //Yelp or SF Fun Cheap?
  //Get all entries from the DB matching the selections
  //Loop through them, placing markers

  $.ajax({
    url: "/wingman.json",
    type: "GET"
  }).done(function(data) {
    $(data).each(function(index, result) {
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

  // for (var i = 0; i < 5; i++) {

  //   var position = new google.maps.LatLng(
  //     southWest.lat() + latSpan * Math.random(),
  //     southWest.lng() + lngSpan * Math.random());
  //   marker = new google.maps.Marker({
  //     position: position,
  //     map: map,
  //     data: {text:'<h4>San Francisco'+i+'</h4><i>Nice city!</i>'},
  //     title: i.toString()
  //   });

  //  google.maps.event.addListener(marker, 'click', function() { 
  //   onItemClick(event, this);   
  // });  
  

  
function onItemClick(event, pin) { 
  var contentString = pin.data.text;
  infowindow.setContent(contentString); 
  infowindow.setPosition(pin.position); 
  infowindow.open(map);
  event.preventDefault();
}   
  
  // var infowindow = new google.maps.InfoWindow({
  //   content: 'Howdy!' + i.toString()
  // });

  // google.maps.event.addListener(marker, 'click', function() {
  //     infowindow.open(map,marker);
  // });

}
google.maps.event.addDomListener(window, 'load', initialize);

