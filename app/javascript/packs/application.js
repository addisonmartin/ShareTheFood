// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Import the application's CSS.
import '../stylesheets/application'

// Import Bootstrap's Javascript.
import 'bootstrap/dist/js/bootstrap'

// Enables Bootstrap's tooltip.
import '../source/bootstrap_tooltip'

// Enables pagination's Javascript.
import '../source/pagy.js.erb'

// Gets the User's local time, to convert time objects to the User's timezone.
import '../source/local_time'

// Enables showing the progress of file uploads after the User submits the form.
import '../source/direct_upload'

// Fixes an issue where Leaflet's images wouldn't load properly with Webpacker.
import L from 'leaflet';
delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
    iconRetinaUrl: require('leaflet/dist/images/marker-icon-2x.png'),
    iconUrl: require('leaflet/dist/images/marker-icon.png'),
    shadowUrl: require('leaflet/dist/images/marker-shadow.png'),
});

// Use Leaflet to display a map, using Open Street Maps data.
import 'leaflet'
import 'leaflet/dist/leaflet.css'
// Enables a mini map in the corner of the map.
require('leaflet-minimap/dist/Control.MiniMap.min.css')
// Enables creating marker clusters.
import 'leaflet.markercluster/dist/leaflet.markercluster'

// Enables viewing the Donation's locations on Donation's show view.
import '../source/show_donation_map'
// Enables viewing all Donation's locations on Donation's index view.
import '../source/donation_index_map'

// Enables autocomplete on Donation's search bar.
import 'jquery-ui/themes/base/core.css'
import 'jquery-ui/themes/base/theme.css'
import 'jquery-ui/themes/base/autocomplete.css'
import 'jquery-ui/ui/widgets/autocomplete'
import '../source/autocomplete'

// Enables automatically setting vegetarian filter to yes when vegan is yes, etc.
import '../source/vegan_vegetarian'
// Enables submitting the Donation filter each time the User changes a value, without the User having to hit the submit button.
import '../source/auto_submit'

// Enables the Apexcharts.
import ApexCharts from 'apexcharts'
window.ApexCharts = ApexCharts

// Enables Chart.js charts (Used for the geographical maps plugin).
require("chart.js")
// Enables the US map with number of User visits per state.
import '../source/visits_map'