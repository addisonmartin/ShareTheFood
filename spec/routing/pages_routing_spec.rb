# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :routing do
  describe 'routing' do
    it 'routes to #about' do
      expect(get: '/about').to route_to('pages#about')
    end

    it 'routes to #about' do
      expect(get: '/').to route_to('pages#about')
    end
  end

  describe 'routing with locale' do
    it 'routes to #about' do
      expect(get: '/en/about').to route_to('pages#about', locale: 'en')
    end

    it 'routes to #about' do
      expect(get: '/en').to route_to('pages#about', locale: 'en')
    end
  end
end
