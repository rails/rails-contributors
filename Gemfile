ruby '2.4.4'
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 5.1.4'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'rugged', '0.27.0'
gem 'unf'
gem 'turbolinks', '~> 5'
gem 'actionpack-page_caching', github: 'rails/actionpack-page_caching', branch: 'master'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2.1'

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'rails-controller-testing'
end

group :deployment do
  gem 'capistrano', '~> 3.10',      require: false
  gem 'capistrano-rails', '~> 1.1', require: false
  gem 'capistrano-rvm', '0.1.1',    require: false
  gem 'capistrano3-puma', '~> 2.0', require: false
  gem 'rbnacl', '>= 3.2', '< 5.0'
  gem 'rbnacl-libsodium'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
end
