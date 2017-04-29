source 'https://rubygems.org'
ruby '2.3.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'

# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'

# Use Puma as the app server
gem 'puma', '~> 3.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)

# ============================
# Routing
# ============================
gem 'friendly_id', '~> 5.1.0'

# ============================
# Model
# ============================
gem 'active_hash'

# ============================
# Controller
# ============================
gem 'responders'

# ============================
# View
# ============================
# Bootstrap & Bootswatch & font-awesome
gem 'bootstrap-sass'
gem 'bootswatch-rails'
gem 'font-awesome-rails'

# Decorator
gem 'draper', '3.0.0.pre1'

# Active Admin
gem 'activeadmin', github: 'activeadmin'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'active_material', github: 'vigetlabs/active_material'

# Fast Haml
gem 'faml'

# Form Builders
gem 'simple_form'

# Pagenation
gem 'kaminari'

# Support MarkDown and syntax
gem 'coderay'
gem 'redcarpet'

# Tagging
gem 'select2-rails'

gem 'html_truncator', '~>0.2'

# ============================
# Authentication
# ============================
gem 'devise'

# ============================
# Config
# ============================

# Configuration using config/settings/#{env}.yml
gem 'config'

# Configuration using ENV
gem 'dotenv-rails'

# ============================
# Database
# ============================
# Seeds
gem 'seed-fu'
# Logical delete
gem 'paranoia', github: 'rubysherpas/paranoia', branch: 'rails5'

# ============================
# Utils
# ============================
gem 'acts-as-taggable-on', '~> 4.0'

# Tracking
gem 'google-analytics-rails'

# ============================
# Environment Group
# ============================
group :development do
  gem 'listen', '~> 3.0.5'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'erb2haml'

  # help to kill N+1
  gem 'bullet'

  # To generate haml view by scaffold or other generate command
  gem 'haml-rails'

  # Syntax Checker
  # hook event pre-commit, pre-push
  gem 'overcommit', require: false

  # A static analysis security vulnerability scanner
  gem 'brakeman', require: false

  # Checks for vulnerable versions of gems
  gem 'bundler-audit', require: false

  # Style checker that helps keep CoffeeScript code clean and consistent
  gem 'coffeelint', require: false

  # Syntax checker for HAML
  gem 'haml-lint', require: false

  # Syntax checker for CSS
  gem 'ruby_css_lint', require: false

  # A Ruby static code analyzer
  gem 'rubocop', require: false

  # Live load browser
  gem 'guard-livereload', require: false

  # Deploy
  gem 'capistrano', '3.5.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rails-console'
  gem 'capistrano-rbenv'
  gem 'capistrano3-puma'
end

group :development, :test do
  # Pry & extensions
  gem 'better_errors'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-stack_explorer'

  # Show SQL result in Pry console
  gem 'awesome_print'
  gem 'hirb'

  # Checks email
  gem 'letter_opener_web'

  # PG/MySQL Log Formatter
  gem 'rails-flog'

  # Table/Schema
  gem 'annotate'

  # Rspec
  gem 'rspec-rails'

  # test fixture
  gem 'factory_girl_rails'

  # Handle events on file modifications
  gem 'guard-rspec',      require: false
  gem 'guard-rubocop',    require: false
end

group :test do
  # Mock for HTTP requests
  gem 'webmock'

  # Time Mock
  gem 'timecop'

  # Support to generate Test Data
  gem 'faker'

  # Cleaning test data
  gem 'database_rewinder'

  # This gem brings back assigns to your controller tests
  gem 'rails-controller-testing'
end
