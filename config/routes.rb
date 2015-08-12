Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  resources :users, only: [:show]

  resources :topics do
    resources :bookmarks, except: [:index]
      resources :likes, only: [:create, :destroy]
  end


  
  get "home/index"
  get "home/about"

  post :incoming, to: 'incoming#create'

  root to: 'home#index'
end
