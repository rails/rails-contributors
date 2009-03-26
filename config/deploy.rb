role :staging, "hashref.com"

def run_in_rc(command)
	run "export PATH=/opt/ree/bin:/usr/local/bin:/usr/bin:/bin:/usr/games; export RAILS_ENV=production; cd /home/fxn/rails-contributors; #{command}"
end

namespace :rc do
  task :pull, :roles => :staging do
    run_in_rc "git pull"
  end

  task :update_repo, :roles => :staging do
    run_in_rc %{script/runner 'Repo.update("/home/fxn/rails")'}
  end

  task :restart, :roles => :staging do
    run_in_rc "touch tmp/restart.txt"
  end

  task :expire_cache, :roles => :staging do
    run_in_rc "rm public/index.html"
    run_in_rc "rm -rf public/contributors"
  end

  task :deploy do
    pull
    update_repo
    restart
    expire_cache
  end
end