Rails.application.routes.draw do
  get 'categories/index'
  root "home#index"
  get 'home/index'

  resources :products
  resources :categories
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
