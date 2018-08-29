function drawRoute(map, markers, styles) {
  let latlngPoint;

  // Do not draw routes if there's no marker
  if (markers.length == 0) { return; }

  const waypoints = markers.slice(1, -1).map (function(marker) {
    latlngPoint = new google.maps.LatLng(marker);

    return google.maps.DirectionsWaypoint = { location: latlngPoint };
  });

  const origin = [markers[0].lat, markers[0].lng];

  const lastIndex   = markers.length - 1
  const destination = [markers[lastIndex].lat, markers[lastIndex].lng];

  map.drawRoute({
    origin:      origin,
    destination: destination,
    waypoints:   waypoints,
    travelMode: 'driving',
    strokeColor: '#F0A202',
    strokeWeight: 5,
  });
}

export { drawRoute }
