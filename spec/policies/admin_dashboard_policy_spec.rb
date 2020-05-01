# frozen_string_literal: true

require 'rails_helper'

describe AdminDashboardPolicy do
  subject { described_class.new(user, :admin_dashboard) }

  let(:donation) { create(:donation) }

  context 'not being signed in' do
    let(:user) { nil }

    it { is_expected.to forbid_action(:show) }
  end

  context 'being a regular user' do
    let(:user) { create(:user) }

    it { is_expected.to forbid_action(:show) }
  end

  context 'being an admin user' do
    let(:user) { create(:admin_user) }

    it { is_expected.to permit_action(:show) }
  end
end
