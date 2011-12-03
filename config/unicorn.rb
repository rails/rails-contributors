require 'pathname'

app_root = Pathname.new(__FILE__).dirname.parent.expand_path.to_s

worker_processes 4
working_directory app_root
listen "/tmp/rails-contributors.sock"
timeout 30
pid "#{app_root}/tmp/pids/unicorn.pid"
stderr_path "#{app_root}/log/unicorn.stderr.log"
stdout_path "#{app_root}/log/unicorn.stdout.log"
