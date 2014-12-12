set :ssh_options, port: 987
server 'contributors.rubyonrails.org', user: 'rails', roles: %w(web app db)

set :puma_bind, 'unix:/tmp/rails-contributors.sock'
set :puma_preload_app, false
set :puma_workers, 2

after 'deploy:finished', :trigger_webhook do
  run_locally do
    execute 'curl -X POST http://contributors.rubyonrails.org:8080/rails-master-hook'
  end
end
