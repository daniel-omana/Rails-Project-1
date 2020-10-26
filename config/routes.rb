Rails.application.routes.draw do
  get 'home/index'
  resources :books, only: %i[index show]
  resources :publishers, only: %i[index show]
end
