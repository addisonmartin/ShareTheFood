# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'posts/show', type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      title: 'MyText',
      subtitle: 'MyText',
      published: false,
      user: nil
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
