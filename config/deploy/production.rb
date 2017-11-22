set :stage, :production
set :branch, 'master'
set :rails_env, 'production'
set :migration_role, 'db'
set :workers, '*': 2
set :log_level, :debug

role :app, %w[takita@tackeyy.com]
role :web, %w[takita@tackeyy.com]
role :db, %w[takita@tackeyy.com]
