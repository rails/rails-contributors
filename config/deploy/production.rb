set :ssh_options, port: 987
server 'contributors.rubyonrails.org', user: 'rails', roles: %w(web app db)
