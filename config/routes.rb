require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  mount ActionCable.server => '/cable'

  devise_for :users
  resources :comments
  resources :posts

  get 'chat', to: 'chat#index'

  root 'chat#index'
end
