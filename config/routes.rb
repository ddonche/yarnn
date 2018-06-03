Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users
  get 'static_pages/home'
  get 'static_pages/help'
  get 'tags/:tag', to: 'tags#show', as: :tag
  get 'tags', to: 'tags#index'

  root 'posts#index'
end
