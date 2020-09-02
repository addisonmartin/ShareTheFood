# frozen_string_literal: true

class DonationsDecorator < Draper::CollectionDecorator
  def search_range
    h.params.dig('search', 'within_distance') or 25
  end
end
