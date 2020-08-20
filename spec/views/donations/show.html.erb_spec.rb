# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'donations/show', type: :view do
  before do
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

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
