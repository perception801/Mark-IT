Rails.application.routes.draw do
  devise_for :users

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  
  get "home/index"
  get "home/about"

  post :incoming, to: 'incoming#create'

  root to: 'home#index'
end
