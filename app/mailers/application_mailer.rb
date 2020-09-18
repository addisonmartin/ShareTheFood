# frozen_string_literal: true

# The default mailer that all other mails inherit from.
class ApplicationMailer < ActionMailer::Base
  default from: 'contact@sharethefood.net'
  layout 'mailer'

  track open: true, click: true
end
