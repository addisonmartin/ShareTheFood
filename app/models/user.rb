# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  discarded_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  locked_at              :datetime
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
#  index_users_on_discarded_at          (discarded_at)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
class User < ApplicationRecord
  # Tracks changes to this model.
  has_paper_trail

  # Enables soft deleting this model.
  include Discard::Model

  has_many :donations, inverse_of: :user
  
  # Enables viewing the visits for a given user.
  # e.g. User.first.visits
  # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :visits, class_name: 'Ahoy::Visit'
  # rubocop:enable Rails/HasManyOrHasOneDependent

  # Include devise modules. Other available is: :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  # Required to be consistent with user's database constraints.
  validates :email, presence: true

  # Override devise's active for authentication method, to disable soft deleted
  # users from being able to sign in.
  def active_for_authentication?
    super && !discarded?
  end

  # Adds a custom message for a discarded account.
  def inactive_message
    !discarded? ? super : :deleted_account
  end
end
