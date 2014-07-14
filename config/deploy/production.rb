set :ssh_options, port: 987
server 'contributors.rubyonrails.org', user: 'rails', roles: %w(web app db)

set :puma_bind, 'unix:/tmp/rails-contributors.sock'
set :puma_preload_app, false
set :puma_workers, 2
