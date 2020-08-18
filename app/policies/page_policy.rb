# frozen_string_literal: true

PagePolicy = Struct.new(:user, :page) do
  # All users are allowed to view the about page.
  def about?
    true
  end
end
