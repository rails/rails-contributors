namespace :contributions do
  desc 'Sync the contributions from scratch'
  task :rebuild do
    on roles(:app) do
      within current_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'contributions:rebuild'
        end
      end
    end
  end
end
