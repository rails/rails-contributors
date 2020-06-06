ruby '2.6.5'

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '6.0.3.rc1'
gem 'pg'
gem 'puma', '~> 3.12'
gem 'rugged', '0.27.0'
gem 'unf'
gem 'turbolinks', '~> 5'
gem 'actionpack-page_caching', '~> 1.2.2'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 5.0.0'

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
  gem 'capistrano3-puma', '~> 3.1', require: false
  gem 'rbnacl', '>= 3.2', '< 5.0'
  gem 'rbnacl-libsodium'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
  gem 'ed25519'
end
