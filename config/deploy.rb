set :stages, %w(production vagrant staging)
set :default_stage, "vagrant"

require 'rvm/capistrano'
require 'capistrano/ext/multistage'
require 'capi/unicorn'
require 'capistrano_colors'

set :application, "ulgood"
set :rvm_type, :user

set :scm, :git
set :repository, "https://github.com/ulmic/ulgood.git"

set :use_sudo, false
set :ssh_options, forward_agent: true
default_run_options[:pty] = true


namespace :settings do
  task :restore do
    run "cd #{current_path} && bash ./lib/settings.sh"
  end
end

namespace :db do
  task :migrate do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} rake db:migrate"
  end
end

namespace :bundler do
  task :install do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle install"
  end
end

after "deploy:create_symlinks", "settings:restore", "db:migrate"
before "db:migrate", "db:backup", "bundler:install"