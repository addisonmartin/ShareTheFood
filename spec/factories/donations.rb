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

require 'faker'

FactoryBot.define do
  factory :donation do
    user { create(:user) }

    name { Faker::Food.dish }
    description { Faker::Food.description }
    latitude { rand(-90..90) }
    longitude { rand(-180..180) }
    pickup_notes { Faker::Lorem.sentence }
    available_until { Faker::Time.between(from: DateTime.now, to: DateTime.now + 3.months) }
    is_perishable { Faker::Boolean.boolean }
    requires_preparation { Faker::Boolean.boolean }
    is_vegetarian { Faker::Boolean.boolean }
    is_vegan { Faker::Boolean.boolean }
    is_kosher { Faker::Boolean.boolean }
    is_halal { Faker::Boolean.boolean }
    contains_gluten { Faker::Boolean.boolean }
    contains_peanuts { Faker::Boolean.boolean }
    contains_tree_nuts { Faker::Boolean.boolean }
    contains_dairy { Faker::Boolean.boolean }
    contains_soy { Faker::Boolean.boolean }
    contains_egg { Faker::Boolean.boolean }
    contains_fish { Faker::Boolean.boolean }
    contains_shellfish { Faker::Boolean.boolean }
  end
end
