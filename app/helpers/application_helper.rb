# frozen_string_literal: true

module ApplicationHelper
  # Enables pagination of models in views.
  include Pagy::Frontend

  # Used to load Bootstrap's SVG icons into HTML pages.
  def icon(icon, options = {})
    file = File.read("node_modules/bootstrap-icons/icons/#{icon}.svg")
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css('svg')

    # Add any of Bootstrap's classes, if provided.
    svg['class'] += ' ' + options[:class] if options[:class].present?

    doc.to_html.html_safe
  end
end
