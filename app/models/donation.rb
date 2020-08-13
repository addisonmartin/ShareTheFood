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
class Donation < ApplicationRecord
  belongs_to :user, inverse_of: :donations

  has_many_attached :images

  # Enables soft deleting this donation (the donation is marked as deleted, but not actually deleted).
  include Discard::Model

  # Links the user analytic visit when the user created the donation to the donation.
  visitable :visit_id
end
