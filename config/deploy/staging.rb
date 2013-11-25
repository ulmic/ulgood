set :rails_env, 'development'
set :branch, 'develop'
set :user, 'deadline_camp'
set :keep_releases, 5
set :app_dir, "/srv/#{application}_staging"
set :current_path, "#{app_dir}/current"
set :deploy_to, "#{app_dir}"

server 'ulgood.ru', :app, :web, :db, :primary => true