# frozen_string_literal: true

class PagePolicy < Struct.new(:user, :page)
  # All users are allowed to view the about page.
  def about?
    true
  end
end