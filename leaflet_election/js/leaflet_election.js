// Creating map object
var myMap = L.map("map", {
  center: [40.7128, -74.0059],
  zoom: 5.2
});

// Adding tile layer
L.tileLayer("https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}", {
  attribution: "© <a href='https://www.mapbox.com/about/maps/'>Mapbox</a> © <a href='http://www.openstreetmap.org/copyright'>OpenStreetMap</a> <strong><a href='https://www.mapbox.com/map-feedback/' target='_blank'>Improve this map</a></strong>",
  tileSize: 512,
  maxZoom: 18,
  zoomOffset: -1,
  id: "mapbox/light-v10",
  accessToken: API_KEY
}).addTo(myMap);

// Use this link to get the geojson data.
var link_counties = "static/data/gz_2010_us_050_00_5m.json";
var link_states = "static/data/united-states.geojson";

var stateStyle = {
  color: "red",
  fillColor: "pink",
  fillOpacity: 0.5,
  weight: 1.5
};

d3.json(link_states, function(data) {
  // Creating a GeoJSON layer with the retrieved data
  L.geoJson(data, {
    // Passing in our style object
    style: stateStyle
  }).addTo(myMap);
});

// Grabbing our GeoJSON data..
d3.json(link_counties, function(data) {
  // Creating a GeoJSON layer with the retrieved data
  L.geoJson(data).addTo(myMap);
});




