$(function () {
    if (document.getElementById('form_map') != null) {
        // Create the Leaflet embedded map.
        var map = L.map('form_map').fitWorld();

        // Added Open Street Map tilelayers to the Leaflet map.
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="https://openstreetmap.org/copyright">OpenStreetMap contributors</a>'
        }).addTo(map);

        // Add the scale marker to the map.
        L.control.scale().addTo(map);

        // Center the map on the user's location, if the user allows location access.
        map.locate({setView: true, maxZoom: 19});

        // Add a marker that the user will use to select the donation's pickup location.
        var donation_pickup_location = L.marker();

        map.on('locationfound', setPin);
        map.on('locationerror', onLocationError);
        map.on('click', setPin);

        // Log the error message to the browser console.
        function onLocationError(e) {
            console.log(e.message);
        }

        // Set a pin at the user's location/user's mouse click location.
        function setPin(e) {
            donation_pickup_location.setLatLng(e.latlng).addTo(map).bindPopup("<b>Selected Pickup Location</b>").openPopup();
            // Fill in the hidden form fields with the pins location.
            $('#donation_latitude').val(e.latlng.lat);
            $('#donation_longitude').val(e.latlng.lng);
        }
    }
})


