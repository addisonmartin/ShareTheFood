# frozen_string_literal: true

AhoyEmail.api = true
AhoyEmail.message_model = -> { EmailAnalytic }

# Email Subscriber is used to add email opened/clicked events to user analytics.
class EmailSubscriber
  def open(event)
    event[:controller].ahoy.track 'Email opened', message_id: event[:message].id
  end

  def click(event)
    event[:controller].ahoy.track 'Email clicked', message_id: event[:message].id, url: event[:url]
  end
end

AhoyEmail.subscribers << EmailSubscriber.new
