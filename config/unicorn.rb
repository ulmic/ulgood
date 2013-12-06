APP_PATH = "/srv/ulgood"

worker_processes 1

working_directory APP_PATH + "/current" # available in 0.94.0+

listen APP_PATH + "/shared/.sock", backlog: 64

timeout 30

pid APP_PATH + "/shared/pids/unicorn.pid"

stderr_path APP_PATH + "/shared/log/unicorn.stderr.log"
stdout_path APP_PATH + "/shared/log/unicorn.stdout.log"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
    GC.copy_on_write_friendly = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.establish_connection
end