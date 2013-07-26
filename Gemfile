source 'https://rubygems.org'

gem 'rails', '3.2.14'
gem 'mysql2'
gem 'rugged', '0.17.0.b7'
gem 'unf'
gem 'turbolinks'

group :development do
  gem "quiet_assets"
  gem "capistrano"
  gem "rvm-capistrano", require: false
  gem 'capistrano-unicorn', github: 'miepleinc/capistrano-unicorn', require: false
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :test do
  gem 'delorean'
end

group :production do
  gem 'unicorn'
end
