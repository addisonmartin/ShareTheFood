# frozen_string_literal: true

# Helper methods that are available to donation models.
module DonationsHelper
  def search_range
    params.dig('search', 'within_distance') or 25
  end

  def search_from
    params.dig('search', 'from')
  end

  def from_current_location
    params.dig('search', 'from_current_location') == 'true'
  end
end
