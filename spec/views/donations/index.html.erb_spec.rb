# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'donations/index', type: :view do
  before do
    assign(:donations, [
             Donation.create!(
               user: nil,
               name: 'MyText',
               description: 'MyText',
               latitude: '9.99',
               longitude: '9.99',
               pickup_notes: 'MyText',
               is_perishable: false,
               requires_preparation: false,
               is_vegetarian: false,
               is_vegan: false,
               contains_gluten: false,
               contains_peanuts: false,
               contains_tree_nuts: false,
               contains_dairy: false,
               contains_soy: false,
               contains_egg: false,
               contains_fish: false,
               contains_shellfish: false
             ),
             Donation.create!(
               user: nil,
               name: 'MyText',
               description: 'MyText',
               latitude: '9.99',
               longitude: '9.99',
               pickup_notes: 'MyText',
               is_perishable: false,
               requires_preparation: false,
               is_vegetarian: false,
               is_vegan: false,
               contains_gluten: false,
               contains_peanuts: false,
               contains_tree_nuts: false,
               contains_dairy: false,
               contains_soy: false,
               contains_egg: false,
               contains_fish: false,
               contains_shellfish: false
             )
           ])
  end

  it 'renders a list of donations' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
  end
end
