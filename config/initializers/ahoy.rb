class Ahoy::Store < Ahoy::DatabaseStore

  # Configures Ahoy to use the Visit database model, as opposed to the default Ahoy::Visit.
  def visit_model
    Visit
  end

  # Configures Ahoy to use the Event database model, as opposed to the default Ahoy::Event.
  def event_model
    Event
  end

  # Also track and store the user's Accept Language from their HTTP request header.
  def track_visit(data)
    data[:accept_language] = request.headers["Accept-Language"]
    super(data)
  end
end

Ahoy.track_bots = true

# Set to true for JavaScript tracking
Ahoy.api = false
