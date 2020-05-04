$(document).on('turbolinks:load', function() {
    if (document.getElementById("index_donation_map") != null) {
        // Create a leaflet map.
        var index_map = L.map('index_donation_map').setView([0, 0], 13);
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

        // var pin = L.marker([gon.donation_latitude, gon.donation_longitude]).addTo(map);
        // pin.bindPopup("<b>" + gon.donation_name + "</b><br>" + gon.donation_pickup_notes).openPopup();
    }
});
