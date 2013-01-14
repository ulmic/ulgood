# -*- encoding : utf-8 -*-
Ulgood::Application.routes.draw do

  get "admin/users"

  get "admin/issues"

  resources :messages

  devise_for :social_accounts, :controllers => { :omniauth_callbacks => "social_accounts/omniauth_callbacks" }

  resources :social_accounts, :only => [ :destroy ]

  root :to => "main#home"

  match "create" => "messages#create", :method => [:post, :get]
  match "login" => "social_accounts#login"
  match "about" => "main#about"
  match "issues" => "admin#issues"
  match "users" => "admin#users"
  match "/admin/delete/:id" => "messages#destroy", :method => :delete
  match "/admin/allow/:id" => "messages#check"

  resources :users

end
