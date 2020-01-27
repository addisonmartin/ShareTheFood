Rails.application.configure do
  config.lograge.enabled = true

  # Add time to log.
  config.lograge.custom_options = lambda do |event|
    { time: Time.now }
  end

  # Add host and user id to log.
  config.lograge.custom_payload do |controller|
    {
      host: controller.request.host,
      user_id: controller.current_user.try(:id)
    }
  end
end