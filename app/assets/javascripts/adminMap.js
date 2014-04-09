$(function() {

  var quadToDay = {
      "A": "Monday",
      "B": "Thursday",
      "C": "Tuesday",
      "D": "Friday",
      "E": "Daily"
  };

  var colors = {
    "A": "#e41a1c",
    "B": "#377eb8",
    "C": "#4daf4a",
    "D": "#984ea3",
    "E": "#ff7f00"
  };

  var map;
  var quads = L.geoJson(quadsJson, {
    onEachFeature: onEachFeature,
    style: style
  });

  function onEachFeature(feature, layer) {
    var pickupDay = quadToDay[feature.properties.QUAD];
    var popupContent = "<strong>Quad:</strong> " + feature.properties.QUAD + "<br><strong>Pickup Day:</strong> " + pickupDay;
    layer.bindPopup(popupContent);

    layer.on('click', function(e) {
      pickup = quadToDay[e.target.feature.properties.QUAD];
      console.log(pickup);
      $.getJSON('/addresses.json?pickup=' + pickup, function(data) {
      data.forEach(function(address) {
        $('.js-addresses tr:last').after('<tr><td>'+ address.street + '</td><td>' + address.pickup + '</tr>' );
        });
      });
    });
  };

  function style(feature) {
    var shared = { stroke: "#111", strokeWidth: 0.1, fillOpacity: 0.6 };
    var ind = { color: colors[feature.properties.QUAD] };
    return $.extend(shared, ind);
  };

  function initMap() {
    map = L.map('map', { zoomControl: false }).setView([38.042, -84.515], 11);
    var tiles = L.tileLayer('https://{s}.tiles.mapbox.com/v3/codeforamerica.hek4o94g/{z}/{x}/{y}.png').addTo(map);
    quads.addTo(map);

    map.dragging.disable();
    map.touchZoom.disable();
    map.doubleClickZoom.disable();
    map.scrollWheelZoom.disable();
    if (map.tap) map.tap.disable();
  };

  initMap();
});