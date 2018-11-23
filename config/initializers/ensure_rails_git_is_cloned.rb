RAILS_GIT = "#{Rails.root}/rails.git"

unless Dir.exists?(RAILS_GIT)
  puts <<~EOS
    Please, mirror the Rails repository using the command
    
      git clone --mirror https://github.com/rails/rails.git

    from the host computer.
    
    Once that is done, if you want to run the website please
    populate the database with

      docker/sync

    This takes a while and it is not necessary if you only
    want to run the test suite.
  EOS

  exit 1
end
