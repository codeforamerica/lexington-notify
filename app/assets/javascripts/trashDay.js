$(function() {
  var quadToDay = {
    "A": "Monday",
    "B": "Thursday",
    "C": "Tuesday",
    "D": "Friday",
    "E": "Daily"
  };

  var quads = L.geoJson(quadsJson);

  function onLocationFound(ll) {
    var layer = leafletPip.pointInLayer(ll, quads);
    if (layer.length) {
      var quad = layer[0].feature.properties.QUAD;
      var pickupDay = quadToDay[quad];
    };

    $('input#pickup').val(pickupDay);
    // document.getElementById('day').innerHTML = layer.length ? '<h2>Your trash gets picked up on ' + pickupDay + '</h2>' : '<h2>Address outside of urban service area.</h2>';
  };

  $('#citizenForm').submit(function(e) {
    e.preventDefault();

    var address = $('#address').val();
    address += ' Lexington, KY'
    var url = 'http://nominatim.openstreetmap.org/search?q='+ encodeURIComponent(address) +'&format=json&limit-1&addressdetails=1';
    var _this = this;
    $.getJSON(url, function(data) {
      var lat = data[0].lat;
      var lon = data[0].lon;

      $('#lat').val(lat);
      $('#lon').val(lon);

      // document.getElementById('coords').innerHTML = '<h2>Your address is located at [' + lat + ', ' + lon + '].</h2>';

      onLocationFound(L.latLng(lat, lon));
      _this.submit();
    });
  });
});
