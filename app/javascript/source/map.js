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

    // Add a pin at the donation's location.
    var marker = L.marker([gon.donation_latitude, gon.donation_longitude]).addTo(map);

    // Add a popup to the pin with the donation's pickup notes.
    marker.bindPopup("<b>Pickup Notes:</b></br>" + gon.donation_pickup_notes).openPopup();
})