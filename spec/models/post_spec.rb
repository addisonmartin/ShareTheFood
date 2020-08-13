# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  published    :boolean
#  slug         :string
#  subtitle     :text
#  title        :text
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
require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
