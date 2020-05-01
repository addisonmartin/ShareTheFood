require 'rails_helper'

describe AdminDashboardPolicy do
  subject { AdminDashboardPolicy.new(user, :admin_dashboard) }

  let(:donation) { create(:donation) }

  context 'not being signed in' do
    let(:user) { nil }

    it { should forbid_action(:show) }
  end

  context 'being a regular user' do
    let(:user) { create(:user) }

    it { should forbid_action(:show) }
  end

  context 'being an admin user' do
    let(:user) { create(:admin_user) }

    it { should permit_action(:show) }
  end
end
