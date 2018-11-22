module RepoCreator
  RAILS_GIT = Rails.root.join('rails.git')

  unless RAILS_GIT.exist?
    `git clone --mirror git://github.com/rails/rails.git #{RAILS_GIT}`
  end
end
