$(document).on('change', '#q_is_vegetarian_eq_true', function() {
    $('#q_is_vegan_eq_').prop('checked', true)
    $('#q_is_vegan_eq_true').prop('checked', false)
    $('#q_is_vegan_eq_false').prop('checked', false)
});

$(document).on('change', '#q_is_vegetarian_eq_false', function() {
    $('#q_is_vegan_eq_').prop('checked', false)
    $('#q_is_vegan_eq_true').prop('checked', false)
    $('#q_is_vegan_eq_false').prop('checked', true)
});

$(document).on('change', '#q_is_vegan_eq_', function() {
    $('#q_is_vegetarian_eq_').prop('checked', true)
    $('#q_is_vegetarian_eq_true').prop('checked', false)
    $('#q_is_vegetarian_eq_false').prop('checked', false)
});

$(document).on('change', '#q_is_vegan_eq_true', function() {
    $('#q_is_vegetarian_eq_').prop('checked', false)
    $('#q_is_vegetarian_eq_true').prop('checked', true)
    $('#q_is_vegetarian_eq_false').prop('checked', false)
});
