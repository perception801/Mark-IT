Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  get "home/about"

  post :incoming, to: 'incoming#create'

  root to: 'home#index'
end
