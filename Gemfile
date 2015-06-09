source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'omniauth'
gem 'omniauth-flickr'
gem 'dotenv-rails', :groups => [:development, :test]
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end
gem 'httparty'

# for infinite scroll
# http://www.sitepoint.com/infinite-scrolling-rails-basics/
gem 'will_paginate', '~> 3.0.5'
gem 'betterlorem', '~> 0.1.2'
gem 'bootstrap-sass', '~> 3.0.3.0'
gem 'bootstrap-will_paginate', '~> 0.0.10'

group :development do
  gem 'capistrano'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
end

gem 'therubyracer', platforms: :ruby

gem 'typhoeus'

gem 'carrierwave'
gem 'fog'

gem 'resque'

group :development, :test do
  gem 'rspec-rails'
end

gem 'aws-ses'

group :production, :staging do
      gem 'pg'
      gem 'rails_12factor'
end
