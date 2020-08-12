# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  published    :boolean
#  subtitle     :text
#  title        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :post do
    title { "MyText" }
    subtitle { "MyText" }
    published { false }
    user { nil }
    discarded_at { "2020-08-12 19:51:29" }
  end
end
