require 'bundler/capistrano'
require 'rvm/capistrano'
require 'capistrano-unicorn'

set :rails_env, 'production'
set :port, 987
server '198.211.102.106', :app, :web, :db, primary: true

set :application, 'rails-contributors'
set :repository, 'git://github.com/fxn/rails-contributors.git'

set :scm, :git
set :branch, :master

set :deploy_to, '/home/rails/rails-contributors'

# With this deploy strategy the server has a checkout of the repo and performs
# a git pull there.
set :deploy_via, :remote_cache

# Once updated it copies the project tree to the release directory, we tell
# Capistrano here not to carry the .git directory in that local copy.
set :copy_exclude, '.git'

set :user, 'rails'
set :group, 'rails'
set :use_sudo, false

namespace :deploy do
  task :symlink_database_yml do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  task :symlink_rails do
    run "ln -nfs #{shared_path}/rails #{release_path}/rails"
  end
end

after 'bundle:install', 'deploy:symlink_database_yml'
after 'bundle:install', 'deploy:migrate'

after 'deploy:restart', 'unicorn:restart'
after 'deploy:restart', 'deploy:cleanup'

__END__

# This is raw SSH via Capistrano. TODO: Modernize this shit.

set :user, 'rails'
role :production, 'contributors.rubyonrails.org'

def execute_in_rc(method, command)
  send(method, "export RAILS_ENV=production; cd ~/rails-contributors; #{command}")
end

def run_in_rc(command)
  execute_in_rc(:run, command)
end

def stream_in_rc(command)
  execute_in_rc(:stream, command)
end

namespace :rc do
  task :tail, :roles => :production do
    stream_in_rc 'tail -f log/production.log'
  end

  task :pull, :roles => :production do
    run_in_rc 'git pull'
  end

  task :bundle, :roles => :production do
    run_in_rc 'bundle install'
  end

  task :repo_sync, :roles => :production do
    run_in_rc 'bundle exec rails runner Repo.sync'
  end

  task :precompile_assets, :roles => :production do
    run_in_rc 'bundle exec rake assets:precompile'
  end

  task :restart_unicorn, :roles => :production do
    run_in_rc 'config/unicorn.sh restart'
  end

  task :expire_cache, :roles => :production do
    run_in_rc 'bundle exec rails runner ApplicationUtils.expire_cache'
  end

  task :deploy_mappings, :roles => :production do
    pull
    repo_sync
  end

  task :deploy, :roles => :production do
    pull
    bundle
    repo_sync
    precompile_assets
    expire_cache
    restart_unicorn
  end

  task :maintenance_on, :roles => :production do
    run_in_rc 'cp public/system/maintenance.html.deleteme public/system/maintenance.html'
  end

  task :maintenance_off, :roles => :production do
    run_in_rc 'rm public/system/maintenance.html'
  end
end
