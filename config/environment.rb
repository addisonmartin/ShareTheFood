# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Configures emails to be sent by SendGrid.
ActionMailer::Base.smtp_settings = {
  user_name: Rails.application.credentials.dig(:sendgird, :username),
  password: Rails.application.credentials.dig(:sendgird, :password),
  domain: 'em4090.sharethefood.net',
  address: 'smtp.sendgrid.net',
  port: 465,
  authentication: :plain,
  enable_starttls_auto: true
}
