Rails.application.routes.draw do

  root 'welcome#index'
  get 'welcome/index'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :photos
      resources :albums
      get '/users/:user_id/albums', to: 'albums#show_by_user', as: :album_by_user
      resources :posts
    end
  end
end
