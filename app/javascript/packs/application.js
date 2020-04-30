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
