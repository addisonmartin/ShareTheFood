# frozen_string_literal: true

require 'rails_helper'

describe DonationPolicy do
  subject { described_class.new(user, donation) }

  let(:donation) { create(:donation) }

  context 'being a visitor' do
    let(:user) { nil }

    it { is_expected.to permit_actions(%i[index show]) }
    it { is_expected.to forbid_actions(%i[new edit create update destroy]) }
  end

  context 'being a signed in user' do
    let(:user) { create(:user) }

    it { is_expected.to permit_actions(%i[index show new create]) }
  end

  context 'being a signed in user and owning the donation' do
    let(:user) { create(:user) }
    let(:donation) { create(:donation, user: user) }

    it { is_expected.to permit_actions(%i[index show new edit create update destroy]) }
  end

  context 'being a signed in user and not owning the donation' do
    let(:user) { create(:user) }

    it { is_expected.to permit_actions(%i[index show new create]) }
    it { is_expected.to forbid_actions(%i[edit update destroy]) }
  end

  context 'being an administrator' do
    let(:user) { create(:admin_user) }

    it { is_expected.to permit_actions(%i[index show new edit create update destroy]) }
  end
end
