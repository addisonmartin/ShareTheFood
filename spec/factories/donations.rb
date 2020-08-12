# == Schema Information
#
# Table name: donations
#
#  id                   :bigint           not null, primary key
#  available_until      :datetime
#  contains_dairy       :boolean
#  contains_egg         :boolean
#  contains_fish        :boolean
#  contains_gluten      :boolean
#  contains_peanuts     :boolean
#  contains_shellfish   :boolean
#  contains_soy         :boolean
#  contains_tree_nuts   :boolean
#  description          :text
#  discarded_at         :boolean
#  is_halal             :boolean
#  is_kosher            :boolean
#  is_perishable        :boolean
#  is_vegan             :boolean
#  is_vegetarian        :boolean
#  latitude             :decimal(, )
#  longitude            :decimal(, )
#  name                 :text
#  pickup_notes         :text
#  requires_preparation :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :bigint           not null
#  visit_id             :bigint
#
# Indexes
#
#  index_donations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :donation do
    user { nil }
    name { "MyText" }
    description { "MyText" }
    latitude { "9.99" }
    longitude { "9.99" }
    pickup_notes { "MyText" }
    available_until { "2020-08-12 01:34:46" }
    is_perishable { false }
    requires_preparation { false }
    is_vegetarian { false }
    is_vegan { false }
    is_kosher { false }
    is_halal { false }
    contains_gluten { false }
    contains_peanuts { false }
    contains_tree_nuts { false }
    contains_dairy { false }
    contains_soy { false }
    contains_egg { false }
    contains_fish { false }
    contains_shellfish { false }
    visit_id { "" }
    discarded_at { false }
  end
end
