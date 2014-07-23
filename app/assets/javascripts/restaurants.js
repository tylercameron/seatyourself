var Map = {};
Map.markers = [];

function initializeMap() {
  Map.options = {
    zoom: 15,
    center: new google.maps.LatLng(Map.latitude, Map.longitude),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  Map.canvas = new google.maps.Map($('#map-canvas')[0], Map.options);

  if (Map.showCenterMarker) {
    var myMarker = new google.maps.Marker({
      position: new google.maps.LatLng(Map.latitude, Map.longitude),
      map: Map.canvas
    });

    Map.markers.push(myMarker);
  }
}

function addMarkers(coords) {
  var image = 'http://maps.google.com/mapfiles/ms/icons/yellow-dot.png';

  coords.forEach(function(coord){
    var myMarker = new google.maps.Marker({
        position: new google.maps.LatLng(coord.latitude, coord.longitude),
        map: Map.canvas,
        icon: image
    });
    Map.markers.push(myMarker);
  });
}

function clearMarkers() {
  Map.markers.forEach(function(marker) {
    marker.setMap(null);
  });
  Map.markers = [];
}

function geolocationSuccess(position){
  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;

  $('.location-error').hide();
  $.ajax({
    url: "/restaurants",
    method: 'GET',
    data: {
      latitude: latitude,
      longitude: longitude,
    },
    dataType: 'script'
  });
}

function geolocationError(){
  var $locationError = $('<p>Unable to find your location</p>');
  $locationError.addClass('location-error');
  $('#current-location').after($locationError);
}

$(document).on('ready page:load', function() {
  $('#current-location').click(function(ev) {
    ev.preventDefault();

    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError);
    } else {
      alert("Get a better browser!");
    }
  });

  if ($('#map-canvas').length) {
    initializeMap();
    if (Map.coords.length > 0) addMarkers(Map.coords);
  }
});
