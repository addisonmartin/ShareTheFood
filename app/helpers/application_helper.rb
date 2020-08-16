# frozen_string_literal: true
module ApplicationHelper
  # Enables pagination on the frontend.
  include Pagy::Frontend

  def flash_class(level)
    case level
      when 'notice' then 'alert-info'
      when 'success' then 'alert-success'
      when 'error' then 'alert-danger'
      when 'alert' then 'alert-warning'
    end
  end
end
