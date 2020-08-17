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
#  index_posts_on_title    (title) UNIQUE
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    subject { build(:post) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user) }
    it { should validate_uniqueness_of(:title) }

    it { should have_rich_text(:body) }
  end

  describe 'database' do
    it { should have_db_column(:id) }
    it { should have_db_column(:discarded_at) }
    it { should have_db_column(:published) }
    it { should have_db_column(:slug) }
    it { should have_db_column(:subtitle) }
    it { should have_db_column(:title) }
    it { should have_db_column(:created_at) }
    it { should have_db_column(:updated_at) }
    it { should have_db_column(:user_id) }

    it { should have_db_index(:slug) }
    it { should have_db_index(:user_id) }
  end
end
