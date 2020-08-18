# frozen_string_literal: true
require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        title: "MyText",
        subtitle: "MyText",
        published: false,
        user: nil
      ),
      Post.create!(
        title: "MyText",
        subtitle: "MyText",
        published: false,
        user: nil
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
