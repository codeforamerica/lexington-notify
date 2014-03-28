var quadToDay = {
			"A": "Monday",
			"B": "Thursday",
			"C": "Tuesday",
			"D": "Friday",
			"E": "Daily"
		};

		function onLocationFound(ll) {
			var layer = leafletPip.pointInLayer(ll, quads);
			var quad = layer[0].feature.properties.QUAD;
			var pickupDay = quadToDay[quad];

			document.getElementById('day').innerHTML = layer.length ? '<h2>Your trash gets picked up on ' + pickupDay + '</h2>' : '';
		};
	
		var quads = L.geoJson(quadsJson);

		onLocationFound(L.latLng(38.060403, -84.508001));