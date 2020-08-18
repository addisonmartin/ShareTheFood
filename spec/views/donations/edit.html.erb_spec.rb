# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'donations/edit', type: :view do
  before(:each) do
    @donation = assign(:donation, Donation.create!(
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
                                    is_kosher: false,
                                    is_halal: false,
                                    contains_gluten: false,
                                    contains_peanuts: false,
                                    contains_tree_nuts: false,
                                    contains_dairy: false,
                                    contains_soy: false,
                                    contains_egg: false,
                                    contains_fish: false,
                                    contains_shellfish: false,
                                    visit_id: '',
                                    discarded_at: false
    ))
  end

  it 'renders the edit donation form' do
    render

    assert_select 'form[action=?][method=?]', donation_path(@donation), 'post' do

      assert_select 'input[name=?]', 'donation[user_id]'

      assert_select 'textarea[name=?]', 'donation[name]'

      assert_select 'textarea[name=?]', 'donation[description]'

      assert_select 'input[name=?]', 'donation[latitude]'

      assert_select 'input[name=?]', 'donation[longitude]'

      assert_select 'textarea[name=?]', 'donation[pickup_notes]'

      assert_select 'input[name=?]', 'donation[is_perishable]'

      assert_select 'input[name=?]', 'donation[requires_preparation]'

      assert_select 'input[name=?]', 'donation[is_vegetarian]'

      assert_select 'input[name=?]', 'donation[is_vegan]'

      assert_select 'input[name=?]', 'donation[is_kosher]'

      assert_select 'input[name=?]', 'donation[is_halal]'

      assert_select 'input[name=?]', 'donation[contains_gluten]'

      assert_select 'input[name=?]', 'donation[contains_peanuts]'

      assert_select 'input[name=?]', 'donation[contains_tree_nuts]'

      assert_select 'input[name=?]', 'donation[contains_dairy]'

      assert_select 'input[name=?]', 'donation[contains_soy]'

      assert_select 'input[name=?]', 'donation[contains_egg]'

      assert_select 'input[name=?]', 'donation[contains_fish]'

      assert_select 'input[name=?]', 'donation[contains_shellfish]'

      assert_select 'input[name=?]', 'donation[visit_id]'

      assert_select 'input[name=?]', 'donation[discarded_at]'
    end
  end
end
