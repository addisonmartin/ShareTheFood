class PostPolicy < ApplicationPolicy
  # Everyone can view all posts.
  def index?
    true
  end

  # Everyone can view a post.
  def show?
    true
  end

  # Only admin users can create a post.
  def create?
    user.admin?
  end

  # Only admin users can update a post.
  def update?
    user.admin?
  end

  # Only admin users can destroy a post.
  def destroy?
    user.admin?
  end
end
