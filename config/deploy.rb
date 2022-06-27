lock '~> 3.10'

set :application, 'rails-contributors'
set :repo_url, 'https://github.com/rails/rails-contributors.git'

set :deploy_to, '/home/rails/rails-contributors'

set :log_level, :info

set :linked_files, %w{config/database.yml config/master.key}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/system public/assets rails.git}

set :keep_releases, 5

set :bundle_without, %w{development test deployment}.join(' ')
set :bundle_gemfile, -> { release_path.join('Gemfile') }
