$( function() {
    $("#search").autocomplete({
        source: '/donations/autocomplete'
    });
});