# frozen_string_literal: true

# The controller for posts. Connects incoming requests to models and views.
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    # Only get posts that have been published.
    # Only get posts that have not been deleted.
    # Ensure the user is allowed to perform this action.
    @posts = authorize Post.kept.published

    # Decorate the posts so its decorator methods can be used within views.
    @posts = @posts.decorate
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    # Ensure the user is allowed to perform this action.
    authorize @post

    # Decorate the post so its decorator methods can be used within views.
    @post = @post.decorate

    # Use conditional GET to only return the post if the user's locally cached version is stale.
    fresh_when last_modified: @post.updated_at.utc, etag: @post
  end

  # GET /posts/new
  def new
    # Ensure the user is allowed to perform this action.
    @post = authorize Post.new
  end

  # GET /posts/1/edit
  def edit
    # Ensure the user is allowed to perform this action.
    authorize @post
  end

  # POST /posts
  # POST /posts.json
  def create
    # Ensure the user is allowed to perform this action.
    @post = authorize Post.new(post_params)
    # Attach the current admin user to the post.
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: t(:post_created_flash) }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    # Ensure the user is allowed to perform this action.
    authorize @post

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: t(:post_updated_flash) }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    # Ensure the user is allowed to perform this action.
    authorize @post

    @post.discard
    respond_to do |format|
      format.html { redirect_to posts_url, notice: t(:post_deleted_flash) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.kept.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :subtitle, :body, :published)
  end
end
