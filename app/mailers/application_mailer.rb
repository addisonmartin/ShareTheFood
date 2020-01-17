# frozen_string_literal: true

# Defines mailer options common to all mailers throughout the application.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
