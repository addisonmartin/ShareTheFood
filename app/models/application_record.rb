# frozen_string_literal: true

# The default model that all other models inherit from.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
