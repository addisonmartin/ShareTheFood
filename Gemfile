source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Use Active Storage variant
gem 'image_processing', '~> 1.2'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Better Errors replaces Rail's default error page in development with an improved, interactive error page.
  gem 'better_errors', '~> 2.7'
  # Binding of Caller is used by Better Errors to enabled its more advanced features.
  gem 'binding_of_caller', '~> 0.8'

  # Pry is a powerful developer console and IRB alternative.
  gem 'pry', '~> 0.13'
  # Pry Rails configures the Rail's console to be replaced with Pry.
  gem 'pry-rails', '~> 0.3'

  # Meta Request enables Rails Panel's functionality in the browser.
  # The Rails Panel plugin can be downloaded from the Firefox/Chrome plugin store.
  gem 'meta_request', '~> 0.7'

  # Annotate automatically adds information about the database schema to the top of relevant classes in the project.
  gem 'annotate', '~> 3.1'
end
