UlgoodRv5::Application.routes.draw do

  devise_for :social_users, :controllers => { :omniauth_callbacks => "social_users/omniauth_callbacks" }
  resources :social_users, :only => [:destroy]

  root :to => "main#home"

  match 'social_users/sign_in' => redirect('/')
  match "login" => "social_users#login"
  match "create" => "message#create", :method => [:post, :get]
  match "thanks" => "message#thanks"
  match "messages/delete" => "message#delete"
  match "users/delete" => "users#delete"
  match "users/add" => "users#add"

  resources :users, :only => [:show]

  match '*path' => redirect('/')

end
