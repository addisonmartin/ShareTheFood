# frozen_string_literal: true

# The user authorization policy for pages.
PagePolicy = Struct.new(:user, :page) do
  # All users are allowed to view the about page.
  def about?
    true
  end
end
