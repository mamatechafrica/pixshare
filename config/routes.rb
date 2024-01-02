Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  get 'search/index', to: 'search#index', as: :search_index

  devise_for :users
  resources :users, only: [:show]

  authenticated :user do
    # root 'home#index', as: :authenticated_root

    resources :comments
    resources :photos
    resources :users
  end
end
