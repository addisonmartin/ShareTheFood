# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/posts', type: :request do
  let(:invalid_attributes) do
    attributes_for(:donation)
  end

  describe 'GET /index' do
    context 'when not signed in' do
      it 'renders a successful response' do
        Post.create! attributes_for(:post)
        get posts_url
        expect(response).to be_successful
      end
    end

    context 'when signed in' do
      it 'renders a successful response' do
        sign_in create(:user)

        Post.create! attributes_for(:post)
        get posts_url
        expect(response).to be_successful
      end
    end

    context 'when signed in as an admin' do
      it 'renders a successful response' do
        sign_in create(:admin)

        Post.create! attributes_for(:post)
        get posts_url
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /show' do
    context 'when not signed in' do
      it 'renders a successful response' do
        post = Post.create! attributes_for(:post)
        get post_url(post)
        expect(response).to be_successful
      end
    end

    context 'when signed in' do
      it 'renders a successful response' do
        sign_in create(:user)

        post = Post.create! attributes_for(:post)
        get post_url(post)
        expect(response).to be_successful
      end
    end

    context 'when signed in as an admin' do
      it 'renders a successful response' do
        sign_in create(:admin)

        post = Post.create! attributes_for(:post)
        get post_url(post)
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /new' do
    context 'when not signed in' do
      it 'raises an unauthorized error' do
        expect { get new_post_url }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    context 'when signed in' do
      it 'raises an unauthorized error' do
        sign_in create(:user)

        expect { get new_post_url }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    context 'when signed in as an admin' do
      it 'renders a successful response' do
        sign_in create(:admin)

        get new_post_url
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /edit' do
    context 'when not signed in' do
      it 'raises an unauthorized error' do
        post = Post.create! attributes_for(:post)
        expect { get edit_post_url(post) }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    context 'when signed in' do
      it 'raises an unauthorized error' do
        sign_in create(:user)

        post = Post.create! attributes_for(:post)
        expect { get edit_post_url(post) }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    context 'when signed in as an admin' do
      it 'render a successful response' do
        sign_in create(:admin)

        post = Post.create! attributes_for(:post)
        get edit_post_url(post)
        expect(response).to be_successful
      end
    end
  end

  describe 'POST /create' do
    context 'when not signed in' do
      context 'with valid parameters' do
        it 'raises an unauthorized error' do
          expect do
            post posts_url, params: { post: attributes_for(:post) }
          end.to raise_error(Pundit::NotAuthorizedError)
        end

        it 'raises an unauthorized error' do
          expect do
            post posts_url, params: { post: attributes_for(:post) }
          end.to raise_error(Pundit::NotAuthorizedError)
        end
      end

      context 'with invalid parameters' do
        it 'raises an unauthorized error' do
          expect do
            post posts_url, params: { post: invalid_attributes }
          end.to raise_error(Pundit::NotAuthorizedError)
        end

        it 'raises an unauthorized error' do
          expect do
            post posts_url, params: { post: invalid_attributes }
          end.to raise_error(Pundit::NotAuthorizedError)
        end
      end
    end

    context 'when signed in' do
      context 'with valid parameters' do
        it 'raises an unauthorized error' do
          sign_in create(:user)

          expect do
            post posts_url, params: { post: attributes_for(:post) }
          end.to raise_error(Pundit::NotAuthorizedError)
        end

        it 'raises an unauthorized error' do
          sign_in create(:user)

          expect do
            post posts_url, params: { post: attributes_for(:post) }
          end.to raise_error(Pundit::NotAuthorizedError)
        end
      end

      context 'with invalid parameters' do
        it 'raises an unauthorized error' do
          sign_in create(:user)

          expect do
            post posts_url, params: { post: invalid_attributes }
          end.to raise_error(Pundit::NotAuthorizedError)
        end

        it 'raises an unauthorized error' do
          sign_in create(:user)

          expect do
            post posts_url, params: { post: invalid_attributes }
          end.to raise_error(Pundit::NotAuthorizedError)
        end
      end
    end

    context 'when signed in as an admin' do
      context 'with valid parameters' do
        it 'creates a new Post' do
          sign_in create(:admin)

          expect do
            post posts_url, params: { post: attributes_for(:post) }
          end.to change(Post, :count).by(1)
        end

        it 'redirects to the created post' do
          sign_in create(:admin)

          post posts_url, params: { post: attributes_for(:post) }
          expect(response).to redirect_to(post_url(Post.last))
        end
      end

      context 'with invalid parameters' do
        it 'does not create a new Post' do
          sign_in create(:admin)

          expect do
            post posts_url, params: { post: invalid_attributes }
          end.to change(Post, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          sign_in create(:admin)

          post posts_url, params: { post: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end
  end

  describe 'PATCH /update' do
    context 'when not signed in' do
    end

    context 'when signed in' do
    end

    context 'when signed in as an admin' do
      context 'with valid parameters' do
        let(:new_attributes) do
          attributes_for(:post)
        end

        it 'updates the requested post' do
          sign_in create(:admin)

          post = Post.create! attributes_for(:post)
          patch post_url(post), params: { post: new_attributes }
          post.reload
          skip('Add assertions for updated state')
        end

        it 'redirects to the post' do
          sign_in create(:admin)

          post = Post.create! valid_attributes
          patch post_url(post), params: { post: new_attributes }
          post.reload
          expect(response).to redirect_to(post_url(post, locale: 'en'))
        end
      end

      context 'with invalid parameters' do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          sign_in create(:admin)

          post = Post.create! attributes_for(:post)
          patch post_url(post), params: { post: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'when not signed in' do
    end

    context 'when signed in' do
    end

    context 'when signed in as an admin' do
      it 'destroys the requested post' do
        sign_in create(:admin)

        post = Post.create! attributes_for(:post)
        expect do
          delete post_url(post)
        end.to change(Post.kept, :count).by(-1)
      end

      it 'redirects to the posts list' do
        sign_in create(:admin)

        post = Post.create! attributes_for(:post)
        delete post_url(post)
        expect(response).to redirect_to(posts_url(locale: 'en'))
      end
    end
  end
end
