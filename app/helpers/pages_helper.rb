# frozen_string_literal: true

module PagesHelper

  def os_data_for_graph(visits)
    data = []

    visits.group(:os).count.each_pair do |os, count|
      data << {name: os, data: count}
    end

    data
  end

end
