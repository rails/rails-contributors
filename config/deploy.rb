set :user, 'rails'
role :production, "contributors.rubyonrails.org"

def execute_in_rc(method, command)
  send(method, "export PATH=/opt/ruby-enterprise/bin:/usr/local/bin:/usr/bin:/bin; export RAILS_ENV=production; cd /home/rails/rails-contributors; #{command}")
end

def run_in_rc(command)
  execute_in_rc(:run, command)
end

def stream_in_rc(command)
  execute_in_rc(:stream, command)
end

namespace :rc do
  task :tail, :roles => :production do
    stream_in_rc "tail -f log/production.log"
  end

  task :pull, :roles => :production do
    run_in_rc "git pull"
  end

  task :bundle, :roles => :production do
    run_in_rc 'bundle install --path ~/.bundle'
  end

  task :update_repo, :roles => :production do
    run_in_rc %{bundle exec rails runner 'Repo.update("/home/rails/master", "origin/master", "origin/2-3-stable", "origin/3-0-stable", "origin/3-1-stable")'}
  end

  task :precompile_assets, :roles => :production do
    run_in_rc %{bundle exec rake assets:precompile}
  end

  task :delete_all_contributions, :roles => :production do
    run_in_rc %{bundle exec rails runner 'Contribution.delete_all'}
  end

  task :restart, :roles => :production do
    run_in_rc "touch tmp/restart.txt"
  end

  task :expire_caches, :roles => :production do
    # Inspired by John Leach's
    # http://blog.brightbox.co.uk/posts/expiring-an-entire-page-cache-tree-atomically
    expired_cache = "tmp/expired_cache.#{Time.now.to_f}"
    run_in_rc "mv tmp/cache #{expired_cache}"
    run_in_rc "rm -rf #{expired_cache}"
  end

  task :deploy do
    pull
    bundle
    precompile_assets
    update_repo
    restart
    expire_caches
  end

  task :maintenance_on, :roles => :production do
    run_in_rc "cp public/system/maintenance.html.deleteme public/system/maintenance.html"
  end

  task :maintenance_off, :roles => :production do
    run_in_rc "rm public/system/maintenance.html"
  end
end
