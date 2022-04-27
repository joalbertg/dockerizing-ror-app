# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.6'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem 'kredis'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.11', '>= 1.11.1', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem 'image_processing', '~> 1.2'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

# Open up your API to the phenomenal OpenAPI ecosystem by exposing OpenAPI files, that describe your service, as JSON
# endpoints. More about the OpenAPI initiative here: http://spec.openapis.org/
gem 'rswag-api', '~> 2.5', '>= 2.5.1'
# Expose beautiful API documentation, powered by Swagger JSON endpoints, including a UI to explore and test
# operations. More about the OpenAPI initiative here: http://spec.openapis.org/
gem 'rswag-ui', '~> 2.5', '>= 2.5.1'
# Simple, efficient background processing for Ruby
gem 'sidekiq', '~> 6.4', '>= 6.4.1'

group :development, :test do
  # Great Ruby debugging companion: pretty print Ruby objects to visualize their structure.
  # Supports custom object formatting via plugins
  gem 'amazing_print', '~> 1.4'
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', '~> 1.5', platforms: %i[mri mingw x64_mingw]
  # factory_bot_rails provides integration between factory_bot and rails 5.0 or newer
  gem 'factory_bot_rails', '~> 6.2'
  # Pry is a runtime developer console and IRB alternative with powerful introspection capabilities
  gem 'pry', '~> 0.14.1'
  # Turn Pry into a primitive debugger. Adds 'step' and 'next' commands to control execution
  gem 'pry-nav', '~> 1.0'
  # Use Pry as your rails console
  gem 'pry-rails', '~> 0.3.9'
  # rspec-rails is a testing framework for Rails 5+
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  # Simplify API integration testing with a succinct rspec DSL and generate OpenAPI specification files directly from
  # your rspecs. More about the OpenAPI initiative here: http://spec.openapis.org/
  gem 'rswag-specs', '~> 2.5', '>= 2.5.1'
  # RuboCop is a Ruby code style checking and code formatting tool. It aims to enforce the
  # community-driven Ruby Style Guide
  gem 'rubocop', '~> 1.28', '>= 1.28.2', require: false
  # A collection of RuboCop cops to check for performance optimizations in Ruby code
  gem 'rubocop-performance', '~> 1.13', '>= 1.13.3', require: false
  # Automatic Rails code style checking tool. A RuboCop extension focused on enforcing Rails best practices and
  # coding conventions
  gem 'rubocop-rails', '~> 2.14', '>= 2.14.2', require: false
  # Code style checking for RSpec files. A plugin for the RuboCop code style enforcing & linting tool
  gem 'rubocop-rspec', '~> 2.10', require: false
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem 'spring'
end

group :test do
  # Strategies for cleaning databases using ActiveRecord. Can be used to ensure a clean state for testing
  gem 'database_cleaner-active_record', '~> 2.0', '>= 2.0.1'
  # Record your test suite's HTTP interactions and replay them during future test runs for fast, deterministic,
  # accurate tests
  gem 'vcr', '~> 6.1'
  # WebMock allows stubbing HTTP requests and setting expectations on HTTP requests
  gem 'webmock', '~> 3.14'
end
