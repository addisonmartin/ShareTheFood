$(document).on('turbolinks:load', function() {
    if (document.getElementById("show_donation_map") != null) {

        var zoom = 13;
        // Add a pin at the User's location if they allow it.
        var geoSuccess = function(position) {
            var lat = position.coords.latitude;
            var lng = position.coords.longitude;

            var pin = L.marker({lat: lat, lng: lng}).addTo(show_map);
            pin.bindPopup("<b>Your current location!</b>")
        };
        // Log to the console if there is an error getting the User's location.
        var geoError = function(error) {
            console.log(error);
        };
        // Get the User's current location.
        navigator.geolocation.getCurrentPosition(geoSuccess, geoError);

        // Create a leaflet map centered on the donation.
        var show_map = L.map('show_donation_map').setView([gon.donation_latitude, gon.donation_longitude], 13);
        // Use Open Street Maps data.
        var show_osm_layer = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(show_map);

        // A new map layer must be used for the mini map.
        var show_osm_mini_map_layer = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        });
        // Enables a minimap in the corner of the map.
        var MiniMap = require('leaflet-minimap');
        new MiniMap(show_osm_mini_map_layer).addTo(show_map);

        // Add the Donation's location as a pin on the map.
        var pin = L.marker([gon.donation_latitude, gon.donation_longitude]).addTo(show_map);
        pin.bindPopup("<b>" + gon.donation_name + "</b><br>" + gon.donation_pickup_notes).openPopup();
    }
});
