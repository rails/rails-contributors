lock '~> 3.10'

set :application, 'rails-contributors'
set :repo_url, 'git://github.com/fxn/rails-contributors.git'

set :deploy_to, '/home/rails/rails-contributors'

set :log_level, :info

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/system public/assets rails.git}

set :keep_releases, 5
