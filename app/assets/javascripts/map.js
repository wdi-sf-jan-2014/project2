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

  infowindow = new google.maps.InfoWindow(); 


  var setMarker = function(position, result) {
    marker = new google.maps.Marker({
      position: position,
      map: map,
      data: {text: "<h4>"+result.name+"</h4><br /><p>"+result.full_address+"</p>"},
      title: result.name
    });
    google.maps.event.addListener(marker, 'click', function() { 
      onItemClick(event, this);
    });
  };

  function onItemClick(event, pin) { 
    var contentString = pin.data.text;
    infowindow.setContent(contentString); 
    infowindow.setPosition(pin.position); 
    infowindow.open(map);
  }  

}

google.maps.event.addDomListener(window, 'load', initialize);