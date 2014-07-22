var Map = {};

Map.latitude = 43.6425662;
Map.longitude = -79.3870568;
Map.showMarkers = true;

function initializeMap() {
  Map.options = {
    zoom: 14,
    center: new google.maps.LatLng(Map.latitude, Map.longitude),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  Map.canvas = new google.maps.Map($('#map-canvas')[0], Map.options);

  if (Map.showMarkers) {
    var myMarker = new google.maps.Marker({
      position: new google.maps.LatLng(Map.latitude, Map.longitude),
      map: Map.canvas
    });
  }
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

  if ($('#map-canvas').length) initializeMap();
});
