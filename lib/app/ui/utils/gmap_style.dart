import 'dart:convert';

const _mapStyle = [
  {
    "featureType": "landscape",
    "elementType": "all",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "poi.business",
    "elementType": "all",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "poi.business",
    "elementType": "labels",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "all",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "poi.school",
    "elementType": "all",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "poi.sports_complex",
    "elementType": "all",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "poi.attraction",
    "elementType": "all",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "transit.station.bus",
    "elementType": "all",
    "stylers": [
      {"visibility": "on"},
      {"saturation": "21"},
      {"weight": "4.05"}
    ]
  }
];

final mapStyle = jsonEncode(_mapStyle);
