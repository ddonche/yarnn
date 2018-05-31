Rails.application.routes.draw do
  devise_for :users
  resources :links
  get 'static_pages/home'
  get 'static_pages/help'

  root 'links#index'
end
