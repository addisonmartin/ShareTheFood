# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/pages', type: :request do
  describe 'GET /about' do
    context 'when not signed in' do
      it 'renders a successful response' do
        get about_url
        expect(response).to be_successful
      end
    end

    context 'when signed in' do
      it 'renders a successful response' do
        sign_in create(:user)

        get about_url
        expect(response).to be_successful
      end
    end

    context 'when signed in as an admin' do
      it 'renders a successful response' do
        sign_in create(:admin)

        get about_url
        expect(response).to be_successful
      end
    end
  end
end
