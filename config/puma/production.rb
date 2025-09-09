#!/usr/bin/env puma

shared_path = "/home/rails/rails-contributors/shared"

directory '/home/rails/rails-contributors/current'
rackup "/home/rails/rails-contributors/current/config.ru"
environment 'production'

pidfile "#{shared_path}/tmp/pids/puma.pid"
state_path "#{shared_path}/tmp/pids/puma.state"
stdout_redirect "#{shared_path}/log/puma_access.log", "#{shared_path}/log/puma_error.log", true

workers 2
threads 3,3

bind "unix://#{shared_path}/tmp/sockets/puma.sock"

restart_command 'bundle exec puma'

prune_bundler

on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/home/rails/rails-contributors/current/Gemfile"
end
