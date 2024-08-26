ruby '3.3.4'

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 7.2.1'

gem 'sprockets-rails'

gem 'rack', '< 4.0'
gem 'pg'
gem 'puma', '~> 5.6'
gem 'rugged', '1.7.2'
gem 'unf'
gem 'turbolinks', '~> 5'
gem 'actionpack-page_caching', '1.2.4'

gem 'sass-rails', '~> 6.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 5.0.0'

group :development do
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'rails-controller-testing'
end

group :deployment do
  gem 'capistrano', '~> 3.19',      require: false
  gem 'capistrano-rails', '~> 1.6', require: false
  gem 'capistrano-rvm', '0.1.2',    require: false
  gem 'capistrano3-puma', '~> 5.2', require: false
  gem 'rbnacl', '>= 3.2', '< 8.0'
  gem 'rbnacl-libsodium'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
  gem 'ed25519'
end
