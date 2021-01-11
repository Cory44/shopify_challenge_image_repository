Rails.application.routes.draw do
  get 'users/:id', to: 'users#show', as: 'user_show'
  get 'home/index'
  get 'photos/index'
  get 'photos/new'
  post 'photos/new', to: 'photos#create', as: 'create'
  get 'albums/new'
  post 'albums/new', to: 'albums#create', as: 'create_album'

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
