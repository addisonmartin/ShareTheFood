# frozen_string_literal: true

# Defines model options common to all models throughout the application.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
