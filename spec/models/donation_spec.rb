# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id                   :bigint(8)        not null, primary key
#  available_until      :datetime         not null
#  contains_dairy       :boolean          default(FALSE)
#  contains_egg         :boolean          default(FALSE)
#  contains_fish        :boolean          default(FALSE)
#  contains_gluten      :boolean          default(FALSE)
#  contains_peanuts     :boolean          default(FALSE)
#  contains_shellfish   :boolean          default(FALSE)
#  contains_soy         :boolean          default(FALSE)
#  contains_tree_nuts   :boolean          default(FALSE)
#  description          :text             default("")
#  discarded_at         :datetime
#  is_perishable        :boolean          default(FALSE)
#  is_vegan             :boolean          default(FALSE)
#  is_vegetarian        :boolean          default(FALSE)
#  latitude             :decimal(10, 6)   not null
#  longitude            :decimal(10, 6)   not null
#  name                 :text             not null
#  pickup_notes         :text             not null
#  requires_preparation :boolean          default(FALSE)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :bigint(8)        not null
#
# Indexes
#
#  index_donations_on_discarded_at  (discarded_at)
#  index_donations_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Donation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
