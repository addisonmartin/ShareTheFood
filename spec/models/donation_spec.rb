# == Schema Information
#
# Table name: donations
#
#  id                   :bigint           not null, primary key
#  available_until      :datetime         not null
#  contains_dairy       :boolean          not null
#  contains_egg         :boolean          not null
#  contains_fish        :boolean          not null
#  contains_gluten      :boolean          not null
#  contains_peanuts     :boolean          not null
#  contains_shellfish   :boolean          not null
#  contains_soy         :boolean          not null
#  contains_tree_nuts   :boolean          not null
#  description          :text
#  discarded_at         :boolean
#  is_halal             :boolean          not null
#  is_kosher            :boolean          not null
#  is_perishable        :boolean          not null
#  is_vegan             :boolean          not null
#  is_vegetarian        :boolean          not null
#  latitude             :decimal(, )      not null
#  longitude            :decimal(, )      not null
#  name                 :text             not null
#  pickup_notes         :text             not null
#  requires_preparation :boolean          not null
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
require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    subject { build(:donation) }

    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:available_until) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:pickup_notes) }

    it { should validate_inclusion_of(:latitude).in_range(-90..90).with_message('must be between -90 and 90.') }
    it { should validate_inclusion_of(:longitude).in_range(-180..180).with_message('must be between -180 and 180.') }
  end

  describe 'database' do
    it { should have_db_column(:id) }
    it { should have_db_column(:available_until) }
    it { should have_db_column(:contains_dairy) }
    it { should have_db_column(:contains_egg) }
    it { should have_db_column(:contains_fish) }
    it { should have_db_column(:contains_gluten) }
    it { should have_db_column(:contains_peanuts) }
    it { should have_db_column(:contains_shellfish) }
    it { should have_db_column(:contains_soy) }
    it { should have_db_column(:contains_tree_nuts) }
    it { should have_db_column(:discarded_at) }
    it { should have_db_column(:is_halal) }
    it { should have_db_column(:is_kosher) }
    it { should have_db_column(:is_perishable) }
    it { should have_db_column(:is_vegan) }
    it { should have_db_column(:is_vegetarian) }
    it { should have_db_column(:latitude) }
    it { should have_db_column(:longitude) }
    it { should have_db_column(:name) }
    it { should have_db_column(:pickup_notes) }
    it { should have_db_column(:requires_preparation) }
    it { should have_db_column(:created_at) }
    it { should have_db_column(:updated_at) }
    it { should have_db_column(:user_id) }
    it { should have_db_column(:visit_id) }

    it { should have_db_index(:user_id) }
  end
end
