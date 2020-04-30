# frozen_string_literal: true

module ApplicationHelper
  # Enables pagination of models in views.
  include Pagy::Frontend

  # Used to convert a boolean to the string Yes/No.
  def as_yes_or_no(boolean)
    boolean ? 'Yes' : 'No'
  end

  # Used to load Bootstrap's SVG icons into HTML pages.
  def icon(icon, options = {})
    file = File.read("node_modules/bootstrap-icons/icons/#{icon}.svg")
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css('svg')

    # Add any of Bootstrap's classes, if provided.
    svg['class'] += ' ' + options[:class] if options[:class].present?

    doc.to_html.html_safe
  end

  # Called from the navigation bar to display sign up/in links for users not signed in, and edit profile/log out links to signed in users.
  def user_links_for_navigation_bar
    content_tag(:div, class: 'collapse navbar-collapse order-2') do
      content_tag(:ul, class: 'navbar-nav ml-auto') do
        # User is not signed in.
        if current_user.nil?
          concat(content_tag(:li, class: 'nav-item active') do
            link_to new_user_session_path, class: 'nav-link' do
              icon('person-check') + ' Log In'
            end
          end)
          concat(content_tag(:li, class: 'nav-item active') do
            link_to new_user_registration_path, class: 'nav-link' do
              icon('person-plus') + ' Sign Up'
            end
          end)
        # User is signed in.
        else
          concat(content_tag(:li, class: 'nav-item active') do
            link_to edit_user_registration_path, class: 'nav-link' do
              icon('gear') + ' Edit Profile'
            end
          end)
          concat(content_tag(:li, class: 'nav-item active') do
            link_to destroy_user_session_path, method: :delete, class: 'nav-link' do
              icon('person-dash') + ' Logout'
            end
          end)
        end
      end
    end
  end

  # Called from the navigation bar to display links only for admin users.
  def admin_links_for_navigation_bar
    unless current_user.nil?
      if current_user.admin?
        content_tag(:li, class: 'nav-item active') do
          link_to admin_path, class: 'nav-link' do
            icon('clipboard-data') + ' Admin Dashboard'
          end
        end
      end
    end
  end
end
