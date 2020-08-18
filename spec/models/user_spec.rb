# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  locked_at              :datetime
#  name                   :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:donations) }
    it { should have_many(:posts) }
    it { should have_many(:login_activities) }
    it { should have_many(:visits) }
  end

  describe 'validations' do
    subject { build(:user) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }

    it { should validate_length_of(:password).is_at_least(10) }
    it { should validate_length_of(:password).is_at_most(256) }
  end

  describe 'database' do
    it { should have_db_column(:id) }
    it { should have_db_column(:admin) }
    it { should have_db_column(:confirmation_sent_at) }
    it { should have_db_column(:confirmation_token) }
    it { should have_db_column(:confirmed_at) }
    it { should have_db_column(:current_sign_in_at) }
    it { should have_db_column(:current_sign_in_ip) }
    it { should have_db_column(:email) }
    it { should have_db_column(:encrypted_password) }
    it { should have_db_column(:failed_attempts) }
    it { should have_db_column(:last_sign_in_at) }
    it { should have_db_column(:last_sign_in_ip) }
    it { should have_db_column(:locked_at) }
    it { should have_db_column(:name) }
    it { should have_db_column(:remember_created_at) }
    it { should have_db_column(:reset_password_sent_at) }
    it { should have_db_column(:reset_password_token) }
    it { should have_db_column(:sign_in_count) }
    it { should have_db_column(:unconfirmed_email) }
    it { should have_db_column(:unlock_token) }
    it { should have_db_column(:created_at) }
    it { should have_db_column(:updated_at) }

    it { should have_db_index(:confirmation_token) }
    it { should have_db_index(:email) }
    it { should have_db_index(:reset_password_token) }
    it { should have_db_index(:unlock_token) }
  end
end
