require 'rails_helper'

RSpec.describe 'posts/new', type: :view do
  before do
    assign(:post, Post.new(
                    title: 'MyText',
                    subtitle: 'MyText',
                    published: false,
                    user: nil
                  ))
  end

  it 'renders new post form' do
    render

    assert_select 'form[action=?][method=?]', posts_path, 'post' do
      assert_select 'textarea[name=?]', 'post[title]'

      assert_select 'textarea[name=?]', 'post[subtitle]'

      assert_select 'input[name=?]', 'post[published]'

      assert_select 'input[name=?]', 'post[user_id]'
    end
  end
end
