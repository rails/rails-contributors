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

  task :expire_cached_pages, :roles => :production do
    run_in_rc 'bundle exec rails runner ApplicationUtils.expire_cached_pages'
  end

  task :deploy, :roles => :production do
    pull
    bundle
    repo_sync
    precompile_assets
    restart_unicorn
  end

  task :maintenance_on, :roles => :production do
    run_in_rc 'cp public/system/maintenance.html.deleteme public/system/maintenance.html'
  end

  task :maintenance_off, :roles => :production do
    run_in_rc 'rm public/system/maintenance.html'
  end
end
