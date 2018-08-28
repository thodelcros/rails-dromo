function drawRoute(map, markers, styles) {
  let latlngPoint;

  const waypoints = markers.slice(1, -1).map (function(marker) {
    latlngPoint = new google.maps.LatLng(marker);

    return google.maps.DirectionsWaypoint = {location: latlngPoint};
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

  map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
  });

  map.setStyle('map_style');
}

export { drawRoute }
