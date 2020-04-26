class Ahoy::Store < Ahoy::DatabaseStore

  # Stores which language the user's browser is requesting, in addition to the usual defaults.
  def track_visit(data)
    data[:accept_language] = request.headers["Accept-Language"]
    super(data)
  end
end

# Creates a new visit after 2 hours of inactivity
Ahoy.visit_duration = 2.hours

# Set to true for JavaScript tracking
Ahoy.api = false
