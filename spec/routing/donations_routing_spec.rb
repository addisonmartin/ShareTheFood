# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DonationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/donations').to route_to('donations#index')
    end

    it 'routes to #new' do
      expect(get: '/donations/new').to route_to('donations#new')
    end

    it 'routes to #show' do
      expect(get: '/donations/1').to route_to('donations#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/donations/1/edit').to route_to('donations#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/donations').to route_to('donations#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/donations/1').to route_to('donations#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/donations/1').to route_to('donations#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/donations/1').to route_to('donations#destroy', id: '1')
    end
  end

  describe 'routing with locale' do
    it 'routes to #index' do
      expect(get: '/en/donations').to route_to('donations#index', locale: 'en')
    end

    it 'routes to #new' do
      expect(get: '/en/donations/new').to route_to('donations#new', locale: 'en')
    end

    it 'routes to #show' do
      expect(get: '/en/donations/1').to route_to('donations#show', locale: 'en', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/en/donations/1/edit').to route_to('donations#edit', locale: 'en', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/en/donations').to route_to('donations#create', locale: 'en')
    end

    it 'routes to #update via PUT' do
      expect(put: '/en/donations/1').to route_to('donations#update', locale: 'en', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/en/donations/1').to route_to('donations#update', locale: 'en', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/en/donations/1').to route_to('donations#destroy', locale: 'en', id: '1')
    end
  end
end
