$(document).ready(function() {
    $('#search_from_current_location').change(function () {
        if (this.checked) {
            $('#search_from').prop('value', gon.latitude + ', ' + gon.longitude);
            $('#search_from').prop('disabled', true);
        }
        else {
            $('#search_from').prop('disabled', false);
        }
    });
});
