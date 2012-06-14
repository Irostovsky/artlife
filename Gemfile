source 'https://rubygems.org'

gem 'rails', '3.2.5'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'jquery-rails'
gem 'devise'
gem 'factory_girl_rails' # move it to staging after staging will appear
gem "twitter-bootstrap-rails"
gem "ckeditor", "3.7.1"
gem "paperclip"
gem 'rails-i18n'
gem "globalize3"
gem 'batch_translations'
gem "acts_as_list-rails3", "~> 0.0.4"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end


group :development do
  gem 'mongrel', '>= 1.2.0.pre2'
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'rvm-capistrano'
end

group :development, :test, :cucumber do
  gem 'rspec-rails'
  gem 'mocha'
  gem 'shoulda-matchers'
  gem 'fakeweb'
  gem 'faker'
end

group :cucumber do
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'email_spec'
  gem 'selenium-webdriver', '= 2.13.0'
  # gem 'capybara-webkit'
  gem 'fakeweb'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
