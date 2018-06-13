Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do
      put "like", to:    "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
    resources :comments do
      member do
        put "like", to:    "comments#upvote"
        put "dislike", to: "comments#downvote"
      end
      resources :notations
    end
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  get 'feed', to: 'static_pages#home'
  get 'static_pages/help'
  get 'y/:tag', to: 'tags#show', as: :tag
  get 'yarnns', to: 'tags#index'
  match '/about', to: 'static_pages#about', via: 'get'
  put 'ipsum', to: "words#generate_ipsum"
  get 'ipsum', to: "words#generate_ipsum"
  
  resources :relationships, only: [:create, :destroy]

  resources :notifications do
    member do
      get :toggle_read
    end
  end
  
  resources :sharings,      only: [:create, :destroy]
  
  authenticated do
    root :to => 'static_pages#home', as: :authenticated
  end

  root :to => 'home#index'
end
