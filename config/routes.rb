Rails.application.routes.draw do
  resources :books do
    member do
      get :toggle_favourite
    end
  end
  
  resources :users
  
  root to: 'books#index'
end
