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
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:available_until) }
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
    it { is_expected.to validate_presence_of(:pickup_notes) }

    it { is_expected.not_to allow_value(nil).for(:is_perishable) }
    it { is_expected.not_to allow_value(nil).for(:requires_preparation) }
    it { is_expected.not_to allow_value(nil).for(:is_vegetarian) }
    it { is_expected.not_to allow_value(nil).for(:is_vegan) }
    it { is_expected.not_to allow_value(nil).for(:contains_gluten) }
    it { is_expected.not_to allow_value(nil).for(:contains_peanuts) }
    it { is_expected.not_to allow_value(nil).for(:contains_tree_nuts) }
    it { is_expected.not_to allow_value(nil).for(:contains_dairy) }
    it { is_expected.not_to allow_value(nil).for(:contains_soy) }
    it { is_expected.not_to allow_value(nil).for(:contains_egg) }
    it { is_expected.not_to allow_value(nil).for(:contains_fish) }
    it { is_expected.not_to allow_value(nil).for(:contains_shellfish) }

    it do
      expect(subject).to validate_inclusion_of(:latitude).in_range(-90..90)
                                                         .with_message('must be between -90 and 90.')
    end

    it do
      expect(subject).to validate_inclusion_of(:longitude).in_range(-180..180)
                                                          .with_message('must be between -180 and 180.')
    end
  end
end
