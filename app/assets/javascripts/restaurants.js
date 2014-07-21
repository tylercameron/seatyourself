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
});