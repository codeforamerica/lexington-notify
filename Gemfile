source 'https://rubygems.org'

# Heroku will use the version of Ruby specified in your Gemfile.
ruby '2.0.0'

#####################################
# Please alphabetize gem dependencies
#####################################
gem 'activerecord-postgis-adapter'

# Official SASS port of Bootstrap - cuz you were gonna use it anyway, right?
gem 'bootstrap-sass', '~> 3.0.3.0'
gem 'debugger'

# enable foreign keys
gem 'foreigner'

# Simple static pages - avoid the common pitfall of maintaining a controller
# with an action for each static page. Just add a file to app/views/pages.
gem 'high_voltage', '~> 2.1'

# Everybody's doing it...
gem 'jquery-rails'

# Heroku prefers PostgreSQL and so do we! One of the 12 factors is dev/prod parity.
# By running PG locally we can be more confident that the database interactions
# developed locally will run appropriately in production.
gem 'pg'

# We don't always use Rails - but when we do - we prefer the latest stable release.
gem 'rails', '4.0.3'

# Better CSS and a low barrier to entry for those familiar with CSS. Valid CSS is
# valid SASS so your existing work will drop in nicely.
gem 'sass-rails', '~> 4.0.0'

# Feel free to use non-minified JS libraries for development. The asset pipeline
# will use uglifier to minify them in production.
gem 'uglifier', '>= 1.3.0'

# Run multiple app instances as individual processes. See config/unicorn.rb for
# configuration details.
gem 'unicorn'

gem 'twilio-ruby'

group :production do
  # Heroku developed this gem to configure app logging and serving assets.
  # This is only necessary in production.
  gem 'rails_12factor'
end

group :development do
  # Security! Do it! Just run `rake sec` or `brakeman` to check your application for
  # security issues before they make it to production. We recommend updating brakeman
  # whenever a new version is released. Running the latest version will ensure
  # it checks for the latest known vulnerabilities. Note: security is hard, brakeman
  # is not a magic bullet.
  gem 'brakeman', require: false

  # Foreman will manage our processes for us! Sure we can run `rails server` for now,
  # but eventually we may need to manage more than one process. Heroku will provide this
  # in production, so we only need to declare foreman in the development environment.
  gem 'foreman'

  # Let's face it, asset logging is not very useful in development.
  gem 'quiet_assets'
end

group :development, :test do
  # To improve dev/prod parity we can define environment variables in a .env file
  # and dotenv-rails will automatically load those variables in development and test
  # environments. This will help avoid conditionals based on the app environment.
  # gem 'dotenv-rails'
  gem 'dotenv', github: 'ecbypi/dotenv', branch: 'overload-environment-variables'

  # Factories or fixtures? We don't really care as long as you have tests. But if we had
  # to make a choice - factories win out. And FactoryGirl is a very flexible way to
  # define and build test objects.
  gem 'factory_girl_rails'

  gem 'faker'
end

group :test do
  gem 'capybara'

  # Cleanliness is next to... well, just make sure your DB is clean for each test.
  gem 'database_cleaner'

  # Tests, tests, tests. Write 'em. Don't like RSpec? No problem - just use something.
  # Note: rspec-rails is intentionally excluded from the development environment to
  # avoid hooking into the Rails generator workflow.
  gem 'rspec-rails'

  # Don't reinvent the wheel - learn how shoulda-matchers can save you time and guide
  # you toward the appropriate levels of abstraction in tests
  gem 'shoulda-matchers'
  gem 'vcr'
  gem 'webmock'
end
