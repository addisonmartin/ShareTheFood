# frozen_string_literal: true

module PagesHelper
  def user_analytic_data_by_attribute(visits, attribute)
    data = []

    # Group and count the data by the given attribute.
    visits.group(attribute).count.each_pair do |key, value|
      # Convert the data to a format that ApexCharts can read.
      data << { name: key, data: value }
    end

    data
  end
end
