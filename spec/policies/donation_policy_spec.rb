require 'rails_helper'

describe DonationPolicy do
  subject { DonationPolicy.new(user, donation) }

  let(:donation) { create(:donation) }

  context 'being a visitor' do
    let(:user) { nil }

    it { should permit_actions([:index, :show]) }
    it { should forbid_actions([:new, :edit, :create, :update, :destroy]) }
  end

  context 'being a signed in user' do
    let(:user) { create(:user) }

    it { should permit_actions([:index, :show, :new, :create]) }
  end

  context 'being a signed in user and owning the donation' do
    let(:user) { create(:user) }

    it { should permit_actions([:index, :show, :new, :edit, :create, :update, :destroy]) }
  end

  context 'being a signed in user and not owning the donation' do
    let(:user) { create(:other_user) }

    it { should permit_actions([:index, :show, :new, :create]) }
    it { should forbid_actions([:edit, :update, :destroy]) }
  end

  context 'being an administrator' do
    let(:user) { create(:admin_user) }

    it { should permit_actions([:index, :show, :new, :edit, :create, :update, :destroy]) }
  end
end
