class Ahoy::Store < Ahoy::DatabaseStore
end

# Set to true for JavaScript tracking
Ahoy.api = false
# Creates a new visit after 3 hours of inactivity.
Ahoy.visit_duration = 3.hours
