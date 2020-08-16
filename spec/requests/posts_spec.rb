 require 'rails_helper'

RSpec.describe "/posts", type: :request do
  let(:valid_attributes) {
    attributes_for(:post)
  }

  let(:invalid_attributes) {
    attributes_for(:donation)
  }

  describe "GET /index" do
    context "not signed in" do
      it "renders a successful response" do
        Post.create! valid_attributes
        get posts_url
        expect(response).to be_successful
      end
    end

    context "signed in" do
      it "renders a successful response" do
        user = create(:user)
        sign_in user

        Post.create! valid_attributes
        get posts_url
        expect(response).to be_successful
      end
    end

    context "signed in as an admin" do
      it "renders a successful response" do
        admin = create(:admin)
        sign_in admin

        Post.create! valid_attributes
        get posts_url
        expect(response).to be_successful
      end
    end
  end

  describe "GET /show" do
    context "not signed in" do
      it "renders a successful response" do
        post = Post.create! valid_attributes
        get post_url(post)
        expect(response).to be_successful
      end
    end

    context "signed in" do
      it "renders a successful response" do
        user = create(:user)
        sign_in user

        post = Post.create! valid_attributes
        get post_url(post)
        expect(response).to be_successful
      end
    end

    context "signed in as an admin" do
      it "renders a successful response" do
        admin = create(:admin)
        sign_in admin

        post = Post.create! valid_attributes
        get post_url(post)
        expect(response).to be_successful
      end
    end
  end

  describe "GET /new" do
    context "not signed in" do
      it "renders an unauthorized error" do
        expect { get new_post_url }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    context "signed in" do
      it "renders an unauthorized error" do
        user = create(:user)
        sign_in user

        expect { get new_post_url }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    context "signed in as an admin" do
      it "renders a successful response" do
        admin = create(:admin)
        sign_in admin

        get new_post_url
        expect(response).to be_successful
      end
    end
  end

  describe "GET /edit" do
    context "not signed in" do
      it "renders an unauthorized error" do
        post = Post.create! valid_attributes
        expect { get edit_post_url(post) }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    context "signed in" do
      it "renders an unauthorized error" do
        user = create(:user)
        sign_in user

        post = Post.create! valid_attributes
        expect { get edit_post_url(post) }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    context "signed in as an admin" do
      it "render a successful response" do
        admin = create(:user, admin: true)
        sign_in admin

        post = Post.create! valid_attributes
        get edit_post_url(post)
        expect(response).to be_successful
      end
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Post" do
        expect {
          post posts_url, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it "redirects to the created post" do
        post posts_url, params: { post: valid_attributes }
        expect(response).to redirect_to(post_url(Post.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Post" do
        expect {
          post posts_url, params: { post: invalid_attributes }
        }.to change(Post, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post posts_url, params: { post: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested post" do
        post = Post.create! valid_attributes
        patch post_url(post), params: { post: new_attributes }
        post.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the post" do
        post = Post.create! valid_attributes
        patch post_url(post), params: { post: new_attributes }
        post.reload
        expect(response).to redirect_to(post_url(post))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        post = Post.create! valid_attributes
        patch post_url(post), params: { post: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete post_url(post)
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create! valid_attributes
      delete post_url(post)
      expect(response).to redirect_to(posts_url)
    end
  end
end
