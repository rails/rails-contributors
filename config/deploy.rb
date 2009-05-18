role :staging, "hashref.com"

def run_in_rc(command)
  run "export PATH=/opt/ree/bin:/usr/local/bin:/usr/bin:/bin; export RAILS_ENV=production; cd /home/fxn/rails-contributors; #{command}"
end

namespace :rc do
  task :pull, :roles => :staging do
    run_in_rc "git pull"
  end

  task :update_repo, :roles => :staging do
    run_in_rc %{script/runner 'Repo.update("/home/fxn/rails")'}
  end

  task :delete_all_contributions, :roles => :staging do
    run_in_rc %{script/runner 'Contribution.delete_all'}
  end

  task :restart, :roles => :staging do
    run_in_rc "touch tmp/restart.txt"
  end

  task :expire_caches, :roles => :staging do
    run_in_rc "rm -f public/stylesheets/all.css"
    run_in_rc "rm -f public/javascripts/all.js"
    run_in_rc "rm -rf tmp/cache/cache/views"
  end

  task :deploy do
    pull
    update_repo
    restart
    expire_caches
  end

  task :maintenance_on, :roles => :staging do
    run_in_rc "cp public/system/maintenance.html.deleteme public/system/maintenance.html"
  end

  task :maintenance_off, :roles => :staging do
    run_in_rc "rm public/system/maintenance.html"
  end
end
