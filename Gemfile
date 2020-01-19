# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster.
# Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Image Processing provides higher-level image processing helpers that are
# commonly needed when handling image uploads
gem 'image_processing', '~> 1.0'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Devise is used for user authentication
gem 'devise'
# Pundit is used for user authorization
gem 'pundit'
# Paper Trail tracks changes to models, and stores each version of the model.
gem 'paper_trail'
# Discard enables soft deleting, discarding, models so they can still be viewed
# after being deleted.
gem 'discard'
# Bootstrap Form makes it super easy to integrate Bootstrap's form styling with
# Rail's forms.
gem 'bootstrap_form'
# Pagy is used to paginate models
gem 'pagy'
# OJ is used by Pagy's Javascript views to speed up performance
gem 'oj'
# Ahoy tracks visits and events and stores that data in the database
gem 'ahoy_matey'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  # console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # Rubocop is a Ruby static code analyzer and code formatter
  gem 'rubocop', require: false
  # Rubocop Rails is a Rubocop extension focused on enforcing Rails best
  # practices and coding conventions
  gem 'rubocop-rails', require: false
  # Rubocop Performance is a Rubocop extension focused on performance
  # optimization analysis
  gem 'rubocop-performance', require: false
  # Rubocop RSpec is a Rubocop extension focused on RSpec tests specific
  # analysis
  gem 'rubocop-rspec', require: false
  # Rubocop Thread Safety is a Rubocop extension focused on thread-safety
  # analysis
  gem 'rubocop-thread_safety', require: false
  # Rubocop Rake is a Rubocop extension focused on Rake tasks specific analysis
  gem 'rubocop-rake', require: false
  # RSpec replaces Rail's default testing framework
  # Bundle RSpec and its dependencies directly from Github, as the latest
  # version released on RubyGems.org does not work with Rails 6
  gem 'rspec-core', git: 'https://github.com/rspec/rspec-core'
  gem 'rspec-expectations', git: 'https://github.com/rspec/rspec-expectations'
  gem 'rspec-mocks', git: 'https://github.com/rspec/rspec-mocks'
  gem 'rspec-rails', git: 'https://github.com/rspec/rspec-rails'
  gem 'rspec-support', git: 'https://github.com/rspec/rspec-support'
  # Required by RSpec
  gem 'rails-controller-testing'

  # Factory Bot replaces Rail's default test fixtures
  gem 'factory_bot_rails'
  # Faker is used to generate pseudo-realistic data
  gem 'faker'
  # Bullet automatically detects when eager loading should/should not be used
  gem 'bullet'
  # Brakeman is a static analysis tool which checks for security vulnerabilities
  gem 'brakeman'
  # Bundler Audit checks for vulnerable versions of gems in Gemfile.lock
  gem 'bundler-audit'
  # Isolator detects non-atomic database transactions
  gem 'isolator'
  # Database Consistency checks the consistency of database constraints with
  # model validations
  gem 'database_consistency', require: false
  # Strong Migrations catches unsafe database migrations
  gem 'strong_migrations'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console'
  # anywhere in the code
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Better Errors replaces the standard Rails error page with an improved,
  # interactive error page
  gem 'better_errors'
  # Binding of Caller is used by Better Errors to enable REPL, local/instance
  # variable inspection, and pretty stack frame names
  gem 'binding_of_caller'
  # Meta Request allows the Rails Panel Chrome/Firefox plugin to work
  # Rails Panel adds a panel within browser Development Tools that enables
  # viewing the development log, application requests, and more
  gem 'meta_request'
  # Pry is a more powerful IRB (interactive Ruby) alternative
  gem 'pry'
  # Pry Rails changes the Rails console to use Pry
  gem 'pry-rails'
  # Awesome Print pretty prints Ruby objects in full color with proper
  # indentation
  gem 'awesome_print'
  # Annotate automatically adds database schema information as a comment to the
  # top of models, tests, and routes files
  gem 'annotate'
  # Letter Opener sends emails directly to the web browser, so an email server
  # is not required in the development environment
  gem 'letter_opener'
end

group :test do
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'selenium-webdriver'
  gem 'webdrivers'

  # Should Matchers adds many useful RSpec matchers
  gem 'shoulda-matchers'
  # Pundit Matchers adds RSpec matchers for Pundit authorization policies
  gem 'pundit-matchers'
  # Capybara is used to write system tests by simulating how a real user would
  # interact with the app
  gem 'capybara'
  # Capybara Screenshot automatically stores screenshots of failing Capybara
  # tests in tmp/capybara
  gem 'capybara-screenshot'
  # Database Cleaner is used to clean the test database between tests
  gem 'database_cleaner'
  # SimpleCov calculates test coverage
  gem 'simplecov', require: false
  # Adds codecov.io integration
  gem 'codecov', require: false
end
