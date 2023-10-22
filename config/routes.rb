Rails.application.routes.draw do
  devise_for :users
  get 'search/index'
  resources :comments
  resources :photos
  get 'photos/show'
  resources :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
