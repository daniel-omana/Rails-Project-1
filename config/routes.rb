Rails.application.routes.draw do
  resources :books, only: %i[index show]
  resources :publishers, only: %i[index show]
end
