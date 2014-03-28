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

	document.getElementById('day').innerHTML = layer.length ? '<h2>Your trash gets picked up on ' + pickupDay + '</h2>' : '<h2>Address outside of service area.</h2>';
};

$('#geocode').submit(function(e) {
	var address = $('#formValueId').val();
	var url = 'http://nominatim.openstreetmap.org/search?q='+ encodeURIComponent(address) +'&format=json&limit-1&addressdetails=1';
	$.getJSON(url, function(data) {
		var lat = data[0].lat;
		var lon = data[0].lon;

		document.getElementById('coords').innerHTML = '<h2>Your address is located at [' + lat + ', ' + lon + '].</h2>';

		onLocationFound(L.latLng(lat, lon));
	});
	e.preventDefault();
});