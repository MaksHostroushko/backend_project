require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  mount ActionCable.server => '/cable'

  resources :comments
  resources :posts

  get 'chat', to: 'chat#index'

  root 'chat#index'
end
