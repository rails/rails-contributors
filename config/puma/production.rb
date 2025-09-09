#!/usr/bin/env puma

directory '/home/rails/rails-contributors/current'
rackup "/home/rails/rails-contributors/current/config.ru"
environment 'production'

pidfile "/home/rails/rails-contributors/shared/tmp/pids/puma.pid"
state_path "/home/rails/rails-contributors/shared/tmp/pids/puma.state"
stdout_redirect '/home/rails/rails-contributors/shared/log/puma_access.log', '/home/rails/rails-contributors/shared/log/puma_error.log', true

threads 0,16

bind 'unix:/tmp/rails-contributors.sock'

workers 1

restart_command 'bundle exec puma'

prune_bundler

on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/home/rails/rails-contributors/current/Gemfile"
end
