# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Use Active Storage variant. Used to resize uploaded images.
gem 'image_processing', '~> 1.2'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Simple Form is used to replace Rail's default forms with a more powerful alternative.
gem 'simple_form', '~> 5.0'
# Draper is used to add an object-oriented presentation layer to models.
gem 'draper', '~> 4.0'
# Pagy is used to paginate models in views.
gem 'pagy', '~> 3.8'
# OJ is used by Pagy to increase performance.
gem 'oj', '~> 3.10'

# Local Time is used to get the user's timezone and convert time objects to the user's local timezone.
gem 'local_time', '~> 2.1'

# Devise is used to provide user authentication (but not authorization).
gem 'devise', '~> 4.7'
# Pundit is used to provide user authorization (but not authentication).
gem 'pundit', '~> 2.1'

# Paper Trail is used to track and store changes to models.
gem 'paper_trail', '~> 10.3'
# Discard is used to soft delete models, so they can still be viewed after they are deleted.
gem 'discard', '~> 1.2'

# Authtrail is used to store each user's login attempt, and relevant information about that attempt.
gem 'authtrail', '~> 0.2'
# Ahoy Matey is used to track and store page visits and events in the database, for user analytics without using a 3rd party service.
gem 'ahoy_matey', '~> 3.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # Pry is a powerful developer console and IRB alternative.
  gem 'pry', '~> 0.13'
  # Pry Rails configures the Rail's console to be replaced with Pry.
  gem 'pry-rails', '~> 0.3'
  # Pry Byebug adds a debugger and stack explorer to Pry's console.
  gem 'pry-byebug', '~> 3.9'

  # Rubocop is a static code analyzer and linter for Ruby.
  gem 'rubocop', '~> 0.82', require: false
  # Rubocop Rails adds extra checks for Rails specific applications.
  gem 'rubocop-rails', '~> 2.5', require: false
  # Rubocop Performance adds extra performance related checks.
  gem 'rubocop-performance', '~> 1.5', require: false
  # Rubocop Thread Safety adds extra checks related to maintaining thread safety.
  gem 'rubocop-thread_safety', '~> 0.3', require: false
  # Rubocop RSpec adds checks for RSpec tests.
  gem 'rubocop-rspec', '~> 1.38', require: false
  # Rubocop Rake adds Rake task specific checks.
  gem 'rubocop-rake', '~> 0.5', require: false

  # RSPec replaces Rail's default testing framework.
  gem 'rspec-rails', '~> 4.0'

  # Factory Bot Rails is used to replace Rail's default test fixtures, with test factories.
  gem 'factory_bot_rails', '~> 5.1'

  # Faker is used to generate pseudo-realistic data for tests and development.
  gem 'faker', '~> 2.11'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Better Errors replaces Rail's default error page in development with an improved, interactive error page.
  gem 'better_errors', '~> 2.7'
  # Binding of Caller is used by Better Errors to enabled its more advanced features.
  gem 'binding_of_caller', '~> 0.8'

  # Meta Request enables Rails Panel's functionality in the browser.
  # The Rails Panel plugin can be downloaded from the Firefox/Chrome plugin store.
  gem 'meta_request', '~> 0.7'

  # Annotate automatically adds information about the database schema to the top of relevant classes in the project.
  gem 'annotate', '~> 3.1'

  # Letter Opener is used to redirect emails sent from the application directly to a new tab of the web browser.
  gem 'letter_opener', '~> 1.7'

  # Bullet is used to automatically detect N+1 database queries, which should be optimized.
  gem 'bullet', '~> 6.1'
end

group :test do
  # Selenium Webdriver provides the test webdriver for Capybara, which enables testing Javascript functionality in system or feature tests.
  gem 'selenium-webdriver', '~> 3.142'
  # Capybara is used to simulate the user in tests, when writing system or feature tests.
  gem 'capybara', '~> 3.32'
  # Capybara Screenshot automatically saves a screenshot of any failing tests.
  # Screenshots are stored in tmp/capybara.
  gem 'capybara-screenshot', '~> 1.0'

  # Shoulda Matchers adds many, common one-line RSpec matchers useful for testing Rails applications.
  gem 'shoulda-matchers', '~> 4.3'

  # Pundit Matchers adds RSpec test matchers for testing user authorization.
  gem 'pundit-matchers', '~> 1.6'

  # Database Cleaner Active Record automatically cleans the test database after each test.
  gem 'database_cleaner-active_record', '~> 1.8'

  # Simplecov is used to calculate test coverage and generate a report.
  gem 'simplecov', '~> 0.18', require: false
  # Codecov is used to integrate test coverage with codecov.io and Github.
  gem 'codecov', '~> 0.1', require: false
end
