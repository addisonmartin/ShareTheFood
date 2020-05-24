$(document).on('turbolinks:load', function() {
    if (document.getElementById("index_donation_map") != null) {

        var zoom = 20;
        // If the User does not give their location, use these defaults.
        var lat =  38.53220;
        var lng = -77.02069;
        // Update lat and lng to the User's location if they allow it.
        var geoSuccess = function(position) {
            lat = position.coords.latitude;
            lng = position.coords.longitude;
            index_map.setView([lat, lng], zoom)

            // Add the User's current location on the map.
            var pin = L.marker({lat: lat, lng: lng}).addTo(index_map);
            pin.bindPopup("<b>Your current location!</b>").openPopup();
        };
        // Log to the console if there is an error getting the User's location.
        var geoError = function(error) {
            console.log(error);
        };
        // Get the User's current location.
        navigator.geolocation.getCurrentPosition(geoSuccess, geoError);

        // Create a leaflet map.
        var index_map = L.map('index_donation_map').setView([lat, lng], zoom);
        // Use Open Street Maps data.
        var index_osm_layer = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(index_map);

        // A new map layer must be used for the mini map.
        var index_osm_mini_map_layer = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        });
        // Enables a minimap in the corner of the map.
        var MiniMap = require('leaflet-minimap');
        new MiniMap(index_osm_mini_map_layer).addTo(index_map);

        // Adds all of the Donation's locations as markers on the map, using marker clusters if they are close together.
        var markers = L.markerClusterGroup();
        for (i = 0; i < gon.donation_location_information.length; i++) {
            var pin = L.marker({lat: gon.donation_location_information[i].latitude, lng: gon.donation_location_information[i].longitude});
            pin.bindPopup("<b>" + gon.donation_location_information[i].name + "</b><br>" + gon.donation_location_information[i].pickup_notes).openPopup();
            markers.addLayer(pin);
        }
        index_map.addLayer(markers);
    }
});
