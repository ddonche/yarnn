Rails.application.routes.draw do
  devise_for :users
  resources :posts
  get 'static_pages/home'
  get 'static_pages/help'

  root 'posts#index'
end
