source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Rubocop is a Ruby static code analyzer and code formatter
  gem 'rubocop', require: false
  # Rubocop Rails is a Rubocop extension focused on enforcing Rails best practices and coding conventions
  gem 'rubocop-rails', require: false
  # Rubocop Performance is a Rubocop extension focused on performance optimization analysis
  gem 'rubocop-performance', require: false
  # Rubocop RSpec is a Rubocop extension focused on RSpec tests specific analysis
  gem 'rubocop-rspec', require: false
  # Rubocop Thread Safety is a Rubocop extension focused on thread-safety analysis
  gem 'rubocop-thread_safety', require: false
  # Rubocop Rake is a Rubocop extension focused on Rake tasks specific analysis
  gem 'rubocop-rake', require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Better Errors replaces the standard Rails error page with an improved, interactive error page
  gem 'better_errors'
  # Binding of Caller is used by Better Errors to enable REPL, local/instance variable inspection, and pretty stack frame names
  gem 'binding_of_caller'
  # Meta Request allows the Rails Panel Chrome/Firefox plugin to work
  # Rails Panel adds a panel within browser Development Tools that enables viewing the development log, application requests, and more
  gem 'meta_request'
  # Pry is a more powerful IRB (interactive Ruby) alternative
  gem 'pry'
  # Pry Rails changes the Rails console to use Pry.
  gem 'pry-rails'
  # Awesome Print pretty prints Ruby objects in full color with proper indentation.
  gem 'awesome_print'
  # Annotate automatically adds database schema information as a comment to the top of models, tests, and routes files.
  gem 'annotate'
end
