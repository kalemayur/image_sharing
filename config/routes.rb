Rails.application.routes.draw do
    resources :albums do
      resources :images
    end 
  root to: "home#index"
  get "home/all_albums"
  get "home/albums_images"
  devise_for :users, controllers: {sessions: 'users/sessions'}
end
