set :stages, %w(production vagrant staging)
set :default_stage, "vagrant"

require 'capistrano/ext/multistage'
require 'capi/unicorn'

set :application, "ulgood"
set :rvm_type, :user

set :scm, :git
set :repository,  "https://github.com/ulmic/ulgood.git"

set :use_sudo, false
set :ssh_options, forward_agent: true
default_run_options[:pty] = true

require 'capistrano_colors'