# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pages/home.html.erb', type: :view do
  it 'renders the HTML template' do
    render
    expect(rendered).to match '<h1>Homepage</h1>'
  end
end
