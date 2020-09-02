# frozen_string_literal: true

class DonationsDecorator < Draper::CollectionDecorator
  def search_range
    h.params.dig('search', 'within_distance') or 25
  end

  def from_current_location
    h.params.dig('search', 'from_current_location') == '1'
  end
end
