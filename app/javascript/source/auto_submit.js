var select_inputs = [
    '#q_is_perishable_eq_',
    '#q_is_perishable_eq_true',
    '#q_is_perishable_eq_false',
    '#q_requires_preparation_eq_',
    '#q_requires_preparation_eq_true',
    '#q_requires_preparation_eq_false',
    '#q_is_vegetarian_eq_',
    '#q_is_vegetarian_eq_true',
    '#q_is_vegetarian_eq_false',
    '#q_is_vegan_eq_',
    '#q_is_vegan_eq_true',
    '#q_is_vegan_eq_false',
    '#q_contains_gluten_eq_',
    '#q_contains_gluten_eq_true',
    '#q_contains_gluten_eq_false',
    '#q_contains_peanuts_eq_',
    '#q_contains_peanuts_eq_true',
    '#q_contains_peanuts_eq_false',
    '#q_contains_tree_nuts_eq_',
    '#q_contains_tree_nuts_eq_true',
    '#q_contains_tree_nuts_eq_false',
    '#q_contains_dairy_eq_',
    '#q_contains_dairy_eq_true',
    '#q_contains_dairy_eq_false',
    '#q_contains_soy_eq_',
    '#q_contains_soy_eq_true',
    '#q_contains_soy_eq_false',
    '#q_contains_egg_eq_',
    '#q_contains_egg_eq_true',
    '#q_contains_egg_eq_false',
    '#q_contains_fish_eq_',
    '#q_contains_fish_eq_true',
    '#q_contains_fish_eq_false',
    '#q_contains_shellfish_eq_',
    '#q_contains_shellfish_eq_true',
    '#q_contains_shellfish_eq_false'
];

for (i = 0; i < select_inputs.length; i++) {
    $(document).on('change', select_inputs[i], function() {
        $('#donation_search').submit();
    });
}
