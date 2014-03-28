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
	var quad = layer[0].feature.properties.QUAD;
	var pickupDay = quadToDay[quad];

	document.getElementById('day').innerHTML = layer.length ? '<h2>Your trash gets picked up on ' + pickupDay + '</h2>' : '';
};

$('#geocode').submit(function(e) {
	var address = $('#formValueId').val();
	console.log(address);
	debugger;
	var url = 'http://nominatim.openstreetmap.org/search?q='+ encodeURIComponent(address) +'&format=json&limit-1&addressdetails=1';
	console.log(url);
	debugger;
	$.getJSON(url, function(data) {
		console.log(data);
	});
	e.preventDefault;
});

// onLocationFound(L.latLng(38.060403, -84.508001));