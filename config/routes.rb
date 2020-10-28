Rails.application.routes.draw do
  resources :pages, except: [:show]
  get '/pages/:permalink' => 'pages#permalink', as: :permalink

  resources :books, only: %i[index show] do
    collection do
      get "search"
    end
  end
  resources :publishers, only: %i[index show] do
  collection do
    get "search"
  end
end
  resources :authors, only: %i[index show] do
    collection do
      get "search"
    end
  end
  resources :users, only: %i[index show]

  root to: 'home#index'
end
