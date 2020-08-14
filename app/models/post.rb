# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  published    :boolean          default(FALSE), not null
#  slug         :string
#  subtitle     :text
#  title        :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_posts_on_slug     (slug)
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user, inverse_of: :posts

  has_rich_text :body

  # Enables soft deleting posts (a post is marked as deleted, but not actually deleted).
  include Discard::Model

  # Tracks and stores changes to posts.
  has_paper_trail

  # Configures the post's title to be used as the slug in the URL.
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :user, presence: true
  validates :title, uniqueness: true
  validates :published, inclusion: { in: [true, false] }
end
