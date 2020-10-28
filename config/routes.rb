Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  resources :pages, except: [:show]
  get '/pages/:permalink' => 'pages#permalink', as: :permalink

  resources :books, only: %i[index show]
  resources :publishers, only: %i[index show]
  resources :authors, only: %i[index show]

  root to: 'home#index'
end
