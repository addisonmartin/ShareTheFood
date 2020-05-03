$(document).on('turbolinks:load', function() {
    // Create a leaflet map centered on the donation.
    var map = L.map('donationmap').setView([gon.donation_latitude, gon.donation_longitude], 13);
    // Use Open Street Maps data.
    var osm_layer = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    // A new map layer must be used for the mini map.
    var osm_mini_map_layer = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    });
    // Enables a minimap in the corner of the map.
    var MiniMap = require('leaflet-minimap');
    new MiniMap(osm_mini_map_layer).addTo(map);

    var pin = L.marker([gon.donation_latitude, gon.donation_longitude]).addTo(map);
    pin.bindPopup("<b>" + gon.donation_name + "</b><br>" + gon.donation_pickup_notes).openPopup();
});
