DOCS_SERVER_IP = '138.197.6.175'

set :ssh_options, port: 987
server DOCS_SERVER_IP, user: 'rails', roles: %w(web app db)

set :rvm_ruby_version, '3.4.5'
set :rvm_custom_path, '/home/rails/.rvm'

set :puma_access_log, "journal"
set :puma_error_log, "journal"

namespace :deploy do
  after :normalize_assets, :gzip_assets do
    on release_roles(fetch(:assets_roles)) do
      assets_path = release_path.join('public', fetch(:assets_prefix))
      within assets_path do
        execute :find, ". \\( -name '*.js' -o -name '*.css' \\) -print0 | xargs -0 gzip --keep --best --quiet --force"
      end
    end
  end
end

after 'deploy:finished', :trigger_webhook do
  run_locally do
    execute "curl -X POST http://#{DOCS_SERVER_IP}:9292/rails-master-hook"
  end
end

after 'deploy:finished', 'deploy:cleanup_assets'
