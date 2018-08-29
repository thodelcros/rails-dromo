import GMaps from 'gmaps/gmaps.js';
import { drawRoute } from './drawRoute.js';
import { listenForPointCreation } from './createPoint.js'
import { listenForPointsClicks } from './pointsClicks.js'

const styles = [
    {
        "featureType": "administrative",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#6195a0"
            }
        ]
    },
    {
        "featureType": "administrative.country",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "administrative.country",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "administrative.country",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#fffff2"
            }
        ]
    },
    {
        "featureType": "administrative.country",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative.province",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative.province",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative.locality",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "simplified"
            },
            {
                "color": "#ffffff"
            }
        ]
    },
    {
        "featureType": "administrative.neighborhood",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [
            {
                "lightness": "0"
            },
            {
                "saturation": "0"
            },
            {
                "color": "#f5f5f2"
            },
            {
                "gamma": "1"
            }
        ]
    },
    {
        "featureType": "landscape.man_made",
        "elementType": "all",
        "stylers": [
            {
                "lightness": "-3"
            },
            {
                "gamma": "1.00"
            }
        ]
    },
    {
        "featureType": "landscape.natural",
        "elementType": "all",
        "stylers": [
            {
                "color": "#2f405c"
            }
        ]
    },
    {
        "featureType": "landscape.natural.landcover",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#2f405c"
            },
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "landscape.natural.landcover",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#ff0000"
            }
        ]
    },
    {
        "featureType": "landscape.natural.terrain",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "landscape.natural.terrain",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#ff0000"
            }
        ]
    },
    {
        "featureType": "landscape.natural.terrain",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#ff0000"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.business",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "off"
            },
            {
                "color": "#fae5ba"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
            {
                "saturation": -100
            },
            {
                "lightness": 45
            },
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#fac9a9"
            },
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "labels.text",
        "stylers": [
            {
                "color": "#4e4e4e"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#787878"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "transit.line",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit.station",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit.station.airport",
        "elementType": "labels.icon",
        "stylers": [
            {
                "hue": "#0a00ff"
            },
            {
                "saturation": "-77"
            },
            {
                "gamma": "0.57"
            },
            {
                "lightness": "0"
            }
        ]
    },
    {
        "featureType": "transit.station.rail",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#43321e"
            }
        ]
    },
    {
        "featureType": "transit.station.rail",
        "elementType": "labels.icon",
        "stylers": [
            {
                "hue": "#ff6c00"
            },
            {
                "lightness": "4"
            },
            {
                "gamma": "0.75"
            },
            {
                "saturation": "-68"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#eaf6f8"
            },
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#fae5ba"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "lightness": "-49"
            },
            {
                "saturation": "-53"
            },
            {
                "gamma": "0.79"
            }
        ]
    }
];

function renderMap(drawRouteFlag) {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
    const markers = JSON.parse(mapElement.dataset.markers).map((marker) => {

      let markerCorrectlyPositionned = {
        lat: marker.lat,
        lng: marker.lng,
        label: marker.label,
        icon: {
          url: marker.icon.url,
          // scaledSize: new google.maps.Size(marker.icon.scaledSize[0], marker.icon.scaledSize[1]),
          origin: new google.maps.Point(marker.icon.origin[0], marker.icon.origin[1]),
          // anchor: new google.maps.Point(marker.icon.anchor[0], marker.icon.anchor[1]),
          labelOrigin: new google.maps.Point(marker.icon.labelOrigin[0], marker.icon.labelOrigin[1])
        }
      }

      return markerCorrectlyPositionned;
    });

    const mapMarkers = map.addMarkers(markers);

    if (markers.length === 0) {
      map.setZoom(2);
    } else if (markers.length === 1) {
      map.setCenter(markers[0].lat, markers[0].lng);
      map.setZoom(14);
    } else {
      map.fitLatLngBounds(markers);
    }

    if (drawRouteFlag) {
      drawRoute(map, markers);
    }


    map.addStyle({
      styles: styles,
      mapTypeId: 'map_style'
    });

    map.setStyle('map_style');

    window.mapObj = map;


    let stepCards = document.querySelectorAll('.horizontal-card');
    let centerLinks = document.querySelectorAll(".center-link");

    if (stepCards.length > 0) {
      mapMarkers.forEach((marker) => {
        marker.addListener('mouseover', function() {
          let stepCardIndex = Array.prototype.indexOf.call(mapMarkers, marker);
          let stepCard      = stepCards[stepCardIndex];

          stepCard.classList.add('card-hovered');
        });

        marker.addListener('mouseout', function() {
          let stepCardIndex = Array.prototype.indexOf.call(mapMarkers, marker);
          let stepCard      = stepCards[stepCardIndex];

          stepCard.classList.remove('card-hovered');
        });
      });
    }

    stepCards.forEach((stepCard) => {
      stepCard.addEventListener('mouseenter', (event) => {
        let markerIndex = Array.prototype.indexOf.call(stepCards, stepCard);
        let marker = mapMarkers[markerIndex];
        marker.setIcon({url: 'https://res.cloudinary.com/thodelcros/image/upload/v1535387727/pin.svg', labelOrigin: new google.maps.Point(13, 13)});
      });

      stepCard.addEventListener('mouseleave', (event) => {
        let markerIndex = Array.prototype.indexOf.call(stepCards, stepCard);
        let marker = mapMarkers[markerIndex];
        marker.setIcon({url: 'https://res.cloudinary.com/thodelcros/image/upload/v1535377577/pin-active.svg', labelOrigin: new google.maps.Point(13, 13)});
      });
    });

    centerLinks.forEach((centerLink) => {
      centerLink.addEventListener('click', (event) => {
        let markerIndex = Array.prototype.indexOf.call(centerLinks, centerLink);
        let marker = markers[markerIndex];
        map.setCenter(marker.lat, marker.lng);
        map.setZoom(10);
      });
    });

    listenForPointsClicks();
  }
}

export { renderMap };
