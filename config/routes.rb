Ulgood::Application.routes.draw do

  root to: "main#home"

  get 'auth/:provider/callback', to: 'accounts#login', as: :login

  resource :accounts, only:[] do
    collection do
      get 'login'
      get 'logout', as: :logout
    end
  end

  resources :goods, only: [:index, :create, :destroy]
  resources :users, only: [:show] do
  end

end
