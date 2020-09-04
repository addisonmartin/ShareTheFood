$(function () {
    if (document.getElementById('index_map') != null) {
        // Create the Leaflet embedded map.
        var map = L.map('index_map').fitWorld();

        // Added Open Street Map tilelayers to the Leaflet map.
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="https://openstreetmap.org/copyright">OpenStreetMap contributors</a>'
        }).addTo(map);

        // Add the scale marker to the map.
        L.control.scale().addTo(map);

        // Add pins to the location of each donation currently being viewed.
        for (i = 0; i < gon.donations_locations.length; i++) {
            var donation = gon.donations_locations[i];
            // Add a pin at the current donation's location.
            var marker = L.marker([donation.latitude, donation.longitude]).addTo(map);
            // Add a popup to the pin with the donation's pickup notes.
            marker.bindPopup("<b>" + donation.name + "</b></br>" + donation.address + "</br><b>Pickup Notes:</b></br>" + donation.pickup_notes);
        }

        // Center the map on the user's location, if the user allows location access.
        map.locate({setView: true, maxZoom: 19});

        map.on('locationfound', onLocationFound);
        map.on('locationerror', onLocationError);

        // Add a pin at the user's approximate location.
        function onLocationFound(e) {
            var location_radius = e.accuracy;

            L.marker(e.latlng).addTo(map).bindPopup("<b>Your current location</b>").openPopup();
            L.circle(e.latlng, location_radius).addTo(map);
            gon.latitude = e.latlng.lat;
            gon.longitude = e.latlng.lng;
        }

        // Log the error message to the browser console.
        function onLocationError(e) {
            console.log(e.message);
        }
    }
})


