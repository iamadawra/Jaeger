# Change these
# server '52.10.113.111', port: 3000, roles: [:web, :app, :db], primary: true
# role :app, "52.10.113.111", :primary => true
# role :db, "cucucity.clhjkp1nirrq.us-west-2.rds.amazonaws.com", :primary => true

# set :repo_url,        'https://github.com/deepfly/CucuCity.git'
set :application,     'CucuCity'
set :user,            'deploy'
set :password,        ''
set :puma_threads,    [4, 16]
set :puma_workers,    0
set :scm, :git
set :repo_url,  'http://deepfly:zzp123567@github.com/iamadawra/Jaeger.git'
# set :scm_username, "deepfly"
# set :scm_password, "zzp123567"

# Don't change these unless you know what you're doing
set :pty,             false
set :use_sudo,        true
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord

## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5

## Linked Files & Directories (Default None):
# set :linked_files, %w{config/database.yml}
# set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/#{fetch(:branch)}`
        puts "WARNING: HEAD is not the same as origin/#{fetch(:branch)}"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
      execute("if [ -n \"$(lsof -i:3000 | grep 'deploy'  | awk '{print $2}')\" ] ; then kill -9 \"$(lsof -i:3000 | grep 'deploy'  | awk 'NR==1{print $2}')\" ; fi")
      execute(". ~/.shrc && cd /home/deploy/CucuCity/current && ~/.rvm/bin/rvm default do bundle exec rake db:drop")
      execute(". ~/.shrc && cd /home/deploy/CucuCity/current && ~/.rvm/bin/rvm default do bundle exec rake db:create")
      execute(". ~/.shrc && cd /home/deploy/CucuCity/current && ~/.rvm/bin/rvm default do bundle exec rake db:migrate")
      execute(". ~/.shrc && cd /home/deploy/CucuCity/current && ~/.rvm/bin/rvm default do bundle exec rake db:seed")
      execute(". ~/.shrc && cd /home/deploy/CucuCity/current && ~/.rvm/bin/rvm default do bundle exec rake db:test:prepare")
      execute(". ~/.shrc && cd /home/deploy/CucuCity/current && ~/.rvm/bin/rvm default do bundle exec rake assets:precompile")
      execute(". ~/.shrc && cd /home/deploy/CucuCity/current && ~/.rvm/bin/rvm default do rails s -b 0.0.0.0 > /dev/null 2>&1 &")
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma