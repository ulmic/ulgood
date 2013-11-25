set :rails_env, 'production'
set :branch, 'master'
set :user, 'deadline_camp'
set :keep_releases, 5
set :app_dir, "/srv/#{application}"
set :current_path, "#{app_dir}/current"
set :deploy_to, "#{app_dir}"

server 'ulgood.ru', :app, :web, :db, :primary => true