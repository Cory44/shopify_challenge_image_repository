Rails.application.routes.draw do
  get 'user/:id', to: 'user#show', as: 'user_show'
  get 'home/index'
  get 'photos/index'
  get 'photos/new'
  post 'photos/new', to: 'photos#create', as: 'create'
  get 'album/new'
  post 'album/new', to: 'album#create', as: 'create_album'

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
