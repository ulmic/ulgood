Ulgood::Application.routes.draw do

  root to: "main#home"

  resource :accounts, only:[] do
    collection do
      get 'login'
      get 'logout'
    end
  end

  resources :goods, only: [:index, :create, :destroy]
  resources :users, only: [:show] do
  end

end
