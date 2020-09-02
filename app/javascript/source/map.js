$(function () {
    // Create the Leaflet embedded map.
    var map = L.map('map').setView([gon.donation_latitude, gon.donation_longitude], 13);

    // Added Open Street Map tilelayers to the Leaflet map.
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '&copy; <a href="https://openstreetmap.org/copyright">OpenStreetMap contributors</a>'
    }).addTo(map);

    // Add the scale marker to the map.
    L.control.scale().addTo(map);

    var marker = L.marker([gon.donation_latitude, gon.donation_longitude]).addTo(map);
})