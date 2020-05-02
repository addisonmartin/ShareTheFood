$(document).on('turbolinks:load', function() {
    var map = L.map('donationmap').setView([gon.donation_latitude, gon.donation_longitude], 13);
    var map_layer = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
});
