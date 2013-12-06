set :rails_env, 'development'
set :branch, 'develop'
set :user, 'vagrant'
set :keep_releases, 5
set :app_dir, "/srv/#{application}"
set :current_path, "#{app_dir}/current"
set :deploy_to, "#{app_dir}"

server 'ulgood', :app, :web, :db, :primary => true

namespace :db do
  task :backup do
    run "" #TODO: current db backup
  end
end