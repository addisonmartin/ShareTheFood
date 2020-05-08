var select_inputs = [
    '#q_is_perishable_eq',
    '#q_requires_preparation_eq',
    '#q_is_vegetarian_eq',
    '#q_is_vegan_eq',
    '#q_contains_gluten_eq',
    '#q_contains_peanuts_eq',
    '#q_contains_tree_nuts_eq',
    '#q_contains_dairy_eq',
    '#q_contains_soy_eq',
    '#q_contains_egg_eq',
    '#q_contains_fish_eq',
    '#q_contains_shellfish_eq'
];

for (i = 0; i < select_inputs.length; i++) {
    $(document).on('change', select_inputs[i], function() {
        $('#donation_search').submit();
    });
}
