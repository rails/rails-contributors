namespace :contributions do
  desc 'Sync the contributions from scratch'
  task rebuild: :environment do
    Repo.sync(rebuild_all: true)
  end
end
