# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET pages/home' do
    it 'returns http status success' do
      get :show, params: { page: 'home' }
      expect(response).to have_http_status(:success)
    end

    it 'renders pages/home.html.erb' do
      get :show, params: { page: 'home' }
      expect(response).to render_template 'pages/home'
    end
  end

  describe 'GET pages/non_existent_page' do
    it 'returns http status not found' do
      get :show, params: { page: 'non_existent_page' }
      expect(response).to have_http_status(:not_found)
    end
  end
end
