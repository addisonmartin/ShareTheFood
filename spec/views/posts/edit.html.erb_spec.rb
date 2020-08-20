# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/edit', type: :view do
  before do
    @post = assign(:post, Post.create!(
                            title: 'MyText',
                            subtitle: 'MyText',
                            published: false,
                            user: nil
                          ))
  end

  it 'renders the edit post form' do
    render

    assert_select 'form[action=?][method=?]', post_path(@post), 'post' do
      assert_select 'textarea[name=?]', 'post[title]'

      assert_select 'textarea[name=?]', 'post[subtitle]'

      assert_select 'input[name=?]', 'post[published]'

      assert_select 'input[name=?]', 'post[user_id]'
    end
  end
end
