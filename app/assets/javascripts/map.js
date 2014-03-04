
var map = {};
var markers = [];

var clearMarkers = function() {
  markers.forEach(function(marker) {
    marker.setMap(null);
  });
  markers = [];
};

var map_initialize = function() {

  var mapOptions = {
    center: new google.maps.LatLng(37.7833, 122.4167),
    zoom: 8,
    styles: [{"featureType":"water","elementType":"geometry","stylers":[{"visibility":"on"},{"color":"#aee2e0"}]},{"featureType":"landscape","elementType":"geometry.fill","stylers":[{"color":"#abce83"}]},{"featureType":"poi","elementType":"geometry.fill","stylers":[{"color":"#769E72"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#7B8758"}]},{"featureType":"poi","elementType":"labels.text.stroke","stylers":[{"color":"#EBF4A4"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"visibility":"simplified"},{"color":"#8dab68"}]},{"featureType":"road","elementType":"geometry.fill","stylers":[{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#5B5B3F"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#ABCE83"}]},{"featureType":"road","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#A4C67D"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#9BBF72"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#EBF4A4"}]},{"featureType":"transit","stylers":[{"visibility":"off"}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"visibility":"on"},{"color":"#87ae79"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#7f2200"},{"visibility":"off"}]},{"featureType":"administrative","elementType":"labels.text.stroke","stylers":[{"color":"#ffffff"},{"visibility":"on"},{"weight":4.1}]},{"featureType":"administrative","elementType":"labels.text.fill","stylers":[{"color":"#495421"}]},{"featureType":"administrative.neighborhood","elementType":"labels","stylers":[{"visibility":"off"}]}]
  };

  map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);

  var southWest = new google.maps.LatLng(37.708894, -122.516908);
  var northEast = new google.maps.LatLng(37.815832, -122.343358);

  var bounds = new google.maps.LatLngBounds(southWest, northEast);
  map.fitBounds(bounds);

  infowindow = new google.maps.InfoWindow(); 
};

function setMarker(result) {
  console.log("in the setMarker function");
  // Populate Google Map with markers
  var position = new google.maps.LatLng(
    result.latitude,
    result.longitude
  );
  // var marker_image = 'images/restaurant.png';
  var marker = new google.maps.Marker({
    position: position,
    map: map,
    // icon: marker_image
    data: {text: "<h4>"+result.name+"</h4><br /><p>"+result.full_address+"</p>"},
    title: result.name
  });
  google.maps.event.addListener(marker, 'click', function() { 
    onItemClick(event, this);
  });
  markers.push(marker);
}

function onItemClick(event, pin) { 
  var contentString = pin.data.text;
  infowindow.setContent(contentString); 
  infowindow.setPosition(pin.position); 
  infowindow.open(map);
}  

$(document).on('ready page:load', map_initialize);

