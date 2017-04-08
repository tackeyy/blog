# Workers are forked web-server processes
workers ENV.fetch('RAILS_WORKERS') { Rails.env.development? ? 0 : 2 }.to_i

# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers a minimum and maximum.
threads_count = ENV.fetch('RAILS_MAX_THREADS') { Rails.env.development? ? 1 : 5 }.to_i
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests, default is 3000.
port ENV.fetch('PORT') { 3000 }

# Specifies the `environment` that Puma will run in.
environment ENV.fetch('RAILS_ENV') { 'development' }

# Use the `preload_app!` method when specifying a `workers` number.
preload_app!

before_fork do
  ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
end

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
