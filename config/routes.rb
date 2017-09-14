Rails.application.routes.draw do
  resources :books
  resources :users
  
  root to: 'books#index'
end
