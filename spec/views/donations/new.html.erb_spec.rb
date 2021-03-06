# frozen_string_literal: true

# require 'rails_helper'
#
# RSpec.describe 'donations/new', type: :view do
#   before do
#     assign(:donation, Donation.new(
#                         user: nil,
#                         name: 'MyText',
#                         description: 'MyText',
#                         latitude: '9.99',
#                         longitude: '9.99',
#                         pickup_notes: 'MyText',
#                         is_perishable: false,
#                         requires_preparation: false,
#                         is_vegetarian: false,
#                         is_vegan: false,
#                         contains_gluten: false,
#                         contains_peanuts: false,
#                         contains_tree_nuts: false,
#                         contains_dairy: false,
#                         contains_soy: false,
#                         contains_egg: false,
#                         contains_fish: false,
#                         contains_shellfish: false
#                       ))
#   end
#
#   it 'renders new donation form' do
#     render
#
#     assert_select 'form[action=?][method=?]', donations_path, 'post' do
#       assert_select 'input[name=?]', 'donation[user_id]'
#
#       assert_select 'textarea[name=?]', 'donation[name]'
#
#       assert_select 'textarea[name=?]', 'donation[description]'
#
#       assert_select 'input[name=?]', 'donation[latitude]'
#
#       assert_select 'input[name=?]', 'donation[longitude]'
#
#       assert_select 'textarea[name=?]', 'donation[pickup_notes]'
#
#       assert_select 'input[name=?]', 'donation[is_perishable]'
#
#       assert_select 'input[name=?]', 'donation[requires_preparation]'
#
#       assert_select 'input[name=?]', 'donation[is_vegetarian]'
#
#       assert_select 'input[name=?]', 'donation[is_vegan]'
#
#       assert_select 'input[name=?]', 'donation[contains_gluten]'
#
#       assert_select 'input[name=?]', 'donation[contains_peanuts]'
#
#       assert_select 'input[name=?]', 'donation[contains_tree_nuts]'
#
#       assert_select 'input[name=?]', 'donation[contains_dairy]'
#
#       assert_select 'input[name=?]', 'donation[contains_soy]'
#
#       assert_select 'input[name=?]', 'donation[contains_egg]'
#
#       assert_select 'input[name=?]', 'donation[contains_fish]'
#
#       assert_select 'input[name=?]', 'donation[contains_shellfish]'
#     end
#   end
# end
