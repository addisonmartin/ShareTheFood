source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Active Storage variant
gem 'image_processing', '~> 1.2'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Strong Migrations catches potentially unsafe database migrations.
# https://github.com/ankane/strong_migrations
gem 'strong_migrations', '~> 0.7'

# Draper adds an object-oriented layer of presentation logic to the application, called decorators.
# https://github.com/drapergem/draper
gem 'draper', '~> 4.0'

# Simple Form replaces Rail's default form DSL.
# https://github.com/heartcombo/simple_form
gem 'simple_form', '~> 5.0'

# Pagy adds pagination of models in views.
# https://github.com/ddnexus/pagy
gem 'pagy', '~> 3.8'
# OJ (Optimized JSON) is used by Pagy to improve its Javascript performance.
# https://github.com/ohler55/oj
gem 'oj', '~> 3.10'

# Ransack is used to sort and filter models in views.
# https://github.com/activerecord-hackery/ransack
gem 'ransack', '~> 2.3'

# Meta Tags adds Ruby helpers for Search Engine Optimization (SEO).
# https://github.com/kpumuk/meta-tags
gem 'meta-tags', '~> 2.13'

# Local Time adds the ability to display times and dates to users in their local timezone.
# https://github.com/basecamp/local_time
gem 'local_time', '~> 2.1'

# Gon is used to easily pass Ruby variables to Javascript.
# https://github.com/gazay/gon
gem 'gon', '~> 6.3'

# ApexCharts adds interactive, Javascript charts written in Ruby.
# https://github.com/styd/apexcharts.rb
gem 'apexcharts', '~> 0.1'
# Groupdate creates scopes to group data by dates or times.
# https://github.com/ankane/groupdate
gem 'groupdate', '~> 5.1'

group :development, :test do
  # Pry is an IRB and Rails console alternative.
  # https://github.com/pry/pry
  gem 'pry', '~> 0.13'
  # Pry Rails configures the 'rails console' command to launch the pry console instead.
  # https://github.com/rweng/pry-rails
  gem 'pry-rails', '~> 0.3'
  # Pry Byebug adds step-by-step debugging to the pry console.
  # https://github.com/deivid-rodriguez/pry-byebug
  gem 'pry-byebug', '~> 3.9'

  # Rubocop is a Ruby linter.
  # https://github.com/rubocop-hq/rubocop
  gem 'rubocop', '~> 0.89', require: false
  # Rubocop Rails adds Ruby on Rails specific checks to Rubocop.
  # https://github.com/rubocop-hq/rubocop-rails
  gem 'rubocop-rails', '~> 2.7', require: false
  # Rubocop RSpec adds RSpec test specific checks to Rubocop.
  # https://github.com/rubocop-hq/rubocop-rspec
  gem 'rubocop-rspec', '~> 1.42', require: false
  # Rubocop i18n adds Rubocop checks that all strings are i18n decorated.
  # https://github.com/puppetlabs/rubocop-i18n
  gem 'rubocop-i18n', '~> 2.0', require: false
  # Rubocop Performance adds performance optimization analysis checks to Rubocop.
  # https://github.com/rubocop-hq/rubocop-performance
  gem 'rubocop-performance', '~> 1.7', require: false
  # Rubocop Thread Safety add thread safety analysis checks to Rubocop.
  # https://github.com/covermymeds/rubocop-thread_safety
  gem 'rubocop-thread_safety', '~> 0.4', require: false
  # Rubocop Rake adds rake task linting to Rubocop.
  # https://github.com/rubocop-hq/rubocop-rake
  gem 'rubocop-rake', '~> 0.5', require: false

  # Brakeman is a static analysis tool which checks for security vulnerabilities.
  # https://github.com/presidentbeef/brakeman
  gem 'brakeman', '~> 4.9'

  # Bullet is used to detect N+1 queries that should be eager loaded.
  # https://github.com/flyerhzm/bullet
  gem 'bullet', '~> 6.1'

  # RSpec is used to replace Rail's default testing framework.
  # https://github.com/rspec/rspec-rails
  gem 'rspec-rails', '~> 4.0'
  # Factory Bot Rails replace Rail's default test fixtures with test factories.
  # https://github.com/thoughtbot/factory_bot_rails
  gem 'factory_bot_rails', '~> 6.1'

  # Faker is used to generate pseudo-realistic test data.
  # https://github.com/faker-ruby/faker
  gem 'faker', '~> 2.13'
end

group :test do
  # Capybara is used by RSpec system tests to test the application by simulating how a real user would interact with it.
  # https://github.com/teamcapybara/capybara#using-capybara-with-rspec
  gem 'capybara', '~> 3.33'
  # Capybara Screenshot automatically takes a screenshot of every failing Capybara test.
  # https://github.com/mattheworiordan/capybara-screenshot
  gem 'capybara-screenshot', '~> 1.0'

  # Simplecov is used to calculate and report test coverage.
  # https://github.com/colszowka/simplecov
  gem 'simplecov', '~> 0.18', require: false

  # Shoulda Matchers adds many, common one-line RSpec test matchers.
  # https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers', '~> 4.3'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Better Errors replaces Rail's default error pages with an improved, interactive error page.
  # https://github.com/BetterErrors/better_errors
  gem 'better_errors', '~> 2.7'
  # Binding of Caller is used by Better Errors to enable Better Error's advanced features.
  # https://github.com/banister/binding_of_caller
  gem 'binding_of_caller', '~> 0.8'

  # Annotate automatically adds a comment summarizing the database schema to the top of relevant files within the application.
  # https://github.com/ctran/annotate_models
  gem 'annotate', '~> 3.1'

  # Meta Request enables the Firefox/Chrome extension Rails Panel.
  # https://github.com/dejan/rails_panel
  gem 'meta_request', '~> 0.7'

  # Letter Opener sends emails directly to the web browser.
  # https://github.com/ryanb/letter_opener
  gem 'letter_opener', '~> 1.7'
end
