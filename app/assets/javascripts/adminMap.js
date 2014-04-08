$(function() {

  var map = L.map('map').setView([38.042, -84.515], 12);
  var tiles = L.tileLayer('https://{s}.tiles.mapbox.com/v3/codeforamerica.hek4o94g/{z}/{x}/{y}.png').addTo(map);

  map.dragging.disable();
  map.touchZoom.disable();
  map.doubleClickZoom.disable();
  map.scrollWheelZoom.disable();
  if (map.tap) map.tap.disable();

  var quadToDay = {
      "A": "Monday",
      "B": "Thursday",
      "C": "Tuesday",
      "D": "Friday",
      "E": "Daily"
  };

  function onEachFeature(feature, layer) {
    var popupContent = "<strong>Quad:</strong> " + feature.properties.QUAD + "<br><strong>Pickup Day:</strong> " + quadToDay[feature.properties.QUAD];
    layer.bindPopup(popupContent);
  };

  var colors = {
    "A": "#e41a1c",
    "B": "#377eb8",
    "C": "#4daf4a",
    "D": "#984ea3",
    "E": "#ff7f00"
  };

  function style(feature) {
    var polyStyle = { strokeWidth: 0, fillOpacity: 0.6 };
    var fill = colors[feature.properties.QUAD];
    return $.extend(polyStyle, fill);
  };

  var quads = L.geoJson(quadsJson, {
    onEachFeature: onEachFeature,
    style: style
  });
  quads.addTo(map);

});