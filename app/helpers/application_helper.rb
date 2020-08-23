# frozen_string_literal: true

module ApplicationHelper
  # Enables pagination on the frontend.
  include Pagy::Frontend

  FLASH_LEVEL_TO_BOOTSTRAP_CLASS = {
    'notice': 'alert-info',
    'success': 'alert-success',
    'error': 'alert-danger',
    'alert': 'alert-warning'
  }.freeze

  # Used to convert Rails alerts to Bootstrap styling.
  def flash_class(level)
    FLASH_LEVEL_TO_BOOTSTRAP_CLASS[level.to_sym]
  end

  # Used to load Bootstrap's SVG icons into HTML pages.
  def icon(icon, options = {})
    file = File.read("node_modules/bootstrap-icons/icons/#{icon}.svg")
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css('svg')

    # Add any of Bootstrap's class options, if provided.
    svg['class'] += " #{options[:class]}" if options[:class].present?

    doc.to_html.html_safe
  end

  # Used from within the navigation bar, adds sign up and sign in or sign out and edit profile links.
  def user_authentication_links
    tag.ul(class: 'navbar-nav ml-auto') do
      if user_signed_in?
        concat(tag.li(class: 'nav-item active') do
          link_to edit_user_registration_path, class: 'nav-link active' do
            icon('person-lines-fill') + ' Edit Profile'
          end
        end)
        concat(tag.li(class: 'nav-item active') do
          link_to destroy_user_session_path, method: :delete, class: 'nav-link active' do
            icon('person-dash') + ' Sign Out'
          end
        end)
      else
        concat(tag.li(class: 'nav-item active') do
          link_to new_user_session_path, class: 'nav-link active' do
            icon('person-check-fill') + ' Sign In'
          end
        end)
        concat(tag.li(class: 'nav-item active') do
          link_to new_user_registration_path, class: 'nav-link active' do
            icon('person-plus') + ' Sign Up'
          end
        end)
      end
    end
  end
end
