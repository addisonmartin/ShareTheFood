# frozen_string_literal: true

module DonationsHelper
  def search_range
    params.dig('search', 'within_distance') or 25
  end

  def from_current_location
    params.dig('search', 'from_current_location') == 'true'
  end
end
