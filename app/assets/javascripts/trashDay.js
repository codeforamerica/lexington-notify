$(function() {
  var quadToDay = {
    "A": "Monday",
    "B": "Thursday",
    "C": "Tuesday",
    "D": "Friday",
    "E": "Daily"
  };

  var quads = L.geoJson(quadsJson);

  function displayError(message) {
    $('.js-message-zone').html('<div class="alert alert-danger">' + message + '</div>');
  }

  function onLocationFound(osmResult, success) {
    var lat = osmResult.lat;
    var lon = osmResult.lon;
    var ll = L.latLng(lat, lon);
    var layer = leafletPip.pointInLayer(ll, quads);
    if (layer.length) {
      var quad = layer[0].feature.properties.QUAD;
      var pickupDay = quadToDay[quad];
      $('input#pickup').val(pickupDay);
      $('#lat').val(lat);
      $('#lon').val(lon);
      success();
    } else {
      displayError("According to our records, this address does not receive city waste pickup. If this is an error, please call Chad Cottle on his cell phone, directly, any time, day or night!");
    }
  };

  function geocode(address, success) {
    address += ' Lexington, KY';
    $.ajax({
      url: 'http://nominatim.openstreetmap.org/search',
      type: 'GET',
      dataType: 'jsonp',
      jsonp: false,
      jsonpCallback: 'json_callback',
      data: {
        format: 'json',
        q: address,
        limit: 1,
        json_callback: 'json_callback'
      },
      success: function(data) {
        if(data.length > 0) {
          onLocationFound(data[0], success);
        } else {
          displayError("Address not found.")
        }
      }
    });
  };

  $('#citizenForm').submit(function(e) {
    e.preventDefault();
    var _this = this;
    geocode($('#address').val(), function() {
      _this.submit();
    });
  });
});
