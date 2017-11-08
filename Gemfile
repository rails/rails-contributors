ruby '2.4.1'
source 'https://rubygems.org'

gem 'rails', '~> 5.1.4'
gem 'pg'
gem 'rugged', '0.21.0'
gem 'unf'
gem 'turbolinks', '~> 5'
gem 'actionpack-page_caching', git: 'https://github.com/rails/actionpack-page_caching.git', branch: 'master'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2.1'

group :development do
  gem 'byebug'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'capistrano', '~> 3.4',       require: false
  gem 'capistrano-rails', '~> 1.1', require: false
  gem 'capistrano-rvm', '0.1.1',    require: false
  gem 'capistrano3-puma', '~> 1.0', require: false
end

group :test do
  gem 'delorean'
  gem 'rails-controller-testing'
end

group :production do
  gem 'puma', '~> 3.7'
end
