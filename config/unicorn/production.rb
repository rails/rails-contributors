worker_processes 4

listen '/tmp/rails-contributors.sock'

root_dir = '/home/rails/rails-contributors/current'

working_directory root_dir
pid "#{root_dir}/tmp/pids/unicorn.pid"
stderr_path "#{root_dir}/log/unicorn.log"
stdout_path "#{root_dir}/log/unicorn.log"

preload_app true

# This is run by the master process when is about to fork a worker.
before_fork do |server, _worker|
  ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill('QUIT', File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # Someone else did our job for us.
    end
  end
end

# This is run by the worker right after it has been forked.
after_fork do |_server, _worker|
  ActiveRecord::Base.establish_connection
end
