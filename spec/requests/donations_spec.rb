# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Donations', type: :request do
  describe 'GET /donations' do
    it 'works! (now write some real specs)' do
      get donations_path
      expect(response).to have_http_status(:ok)
    end
  end
end
