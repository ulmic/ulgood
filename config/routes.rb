Ulgood::Application.routes.draw do

  root to: "main#home"


  get 'auth/:provider', to: 'accounts#login', as: :login
  get 'auth/:provider/callback', to: 'accounts#login'


  resource :admins, only:[] do
    get 'users'
    get 'posts'
  end

  resource :admins, only:[] do
    get 'users'
    get 'posts'
  end

  resource :accounts, only:[] do
    collection do
      get 'login'
      get 'logout', as: :logout
    end
  end

  resources :goods, only: [:index, :create, :destroy] do
    member do
      get 'check'
    end
  end

  resources :users, only: [:show] do
  end

end
