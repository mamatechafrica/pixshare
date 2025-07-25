Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :users, only: [:show, :edit, :update]

  resources :photos do
    resources :comments, only: [:create, :destroy]
    collection { delete 'bulk_destroy' }
    # collection do
    #   delete :bulk_destroy
    # end
  end



  resources :search, only: [:index]

  Rails.application.routes.draw do
    # ... your existing routes ...
    # this is what you want 👇
    direct :rails_blob do |blob|
      route_for(:rails_service_blob, blob.signed_id, blob.filename)
    end

    # ✅ This line mounts Active Storage routes properly
    mount ActiveStorage::Engine => "/rails/active_storage"
  end
end
