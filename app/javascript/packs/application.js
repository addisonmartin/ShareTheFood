// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()

import * as ActiveStorage from "@rails/activestorage"
ActiveStorage.start()

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// Enables the application's stylesheets.
import '../stylesheets/application'

// Include StimulusJS's controllers.
import 'controllers'

// Enables pagination's Javascript.
import '../source/pagy.js.erb'

// Adds the ability to display times and dates to users in their local timezone.
import LocalTime from "local-time"
LocalTime.start()

// Enables ApexChart's Javascript.
import ApexCharts from 'apexcharts'
window.ApexCharts = ApexCharts

// Enables Action Text's rich text editor.
require("trix")
require("@rails/actiontext")

// Enables Bootstrap styling.
import 'bootstrap';

// Enables Bootstrap's tooltip and popover.
$(function () {
    $('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="popover"]').popover();
})

// Enables viewing file upload progress.
import '../source/direct_uploads';

// Enables the datetime picker.
import 'jquery-datetimepicker/build/jquery.datetimepicker.full.min';
$(function () {
    $('#donation_available_until').datetimepicker({
        inline: true,
        minDate: 'yesterday'
    });
})

// Fixes an issue where Webpack cannot properly load in Leaflet's images.
import L from 'leaflet';
delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
    iconRetinaUrl: require('leaflet/dist/images/marker-icon-2x.png'),
    iconUrl: require('leaflet/dist/images/marker-icon.png'),
    shadowUrl: require('leaflet/dist/images/marker-shadow.png'),
});

// Enables the embedded map's CSS. Must be loaded here, not within application.scss.
import 'leaflet/dist/leaflet.css'
// Enables the embedded map's Javascript.
import 'leaflet'
// Load and display the embedded map.
import '../source/map'
