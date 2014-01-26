source 'https://rubygems.org'

ruby '2.0.0'

gem 'bootstrap-sass', '~> 3.0.3.0'
gem 'high_voltage', '~> 2.1'
gem 'jquery-rails'
gem 'pg'
gem 'rails', '4.0.2'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'unicorn'

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'brakeman', require: false
  gem 'foreman'
  gem 'quiet_assets'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end
