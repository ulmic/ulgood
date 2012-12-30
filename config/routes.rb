# -*- encoding : utf-8 -*-
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
  match "admin/new_posts" => "admin#new_posts"
  match "admin/allow" => "admin#allow"
  match "about" => "main#about"

  resources :users, :only => [:show]

  match '*path' => redirect('/')

end
