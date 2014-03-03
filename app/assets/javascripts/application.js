// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

// maps
var map;

function initializeMap() {
  var addMarker = true && showMarker;
  var mapOptions = {
    zoom: 14,
    center: new google.maps.LatLng(latitude, longitude),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map($('#map-canvas')[0], mapOptions);

  if (addMarker) {
    var myMarker = new google.maps.Marker({
        position: new google.maps.LatLng(latitude, longitude),
        map: map
    });
  }
}

function addMarkers(coords) {
  var image = 'http://maps.google.com/mapfiles/ms/icons/yellow-dot.png';

  coords.forEach(function(coord){
    var myMarker = new google.maps.Marker({
        position: new google.maps.LatLng(coord.latitude, coord.longitude),
        map: map,
        icon: image
    });
  });
}


// geolocation
function geolocationSuccess(position) {
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;

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

function geolocationError(error) {
  console.log("There was an error :( ");
}

$(document).ready(function( ) {
  $('#current_location').on('click', function(event) {
    event.preventDefault();
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError);
    } else {
      alert("Get a better browser!");
    }
  });

  if ($('#map-canvas').length > 0) {
    initializeMap();
    if (coords.length > 0) addMarkers(coords);
  }
});
