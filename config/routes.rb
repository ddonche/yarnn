Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do
      put "like", to:    "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
    resources :comments do
      resources :notations
    end
  end
  resources :users
  get 'static_pages/home'
  get 'static_pages/help'
  get 'tags/:tag', to: 'tags#show', as: :tag
  get 'tags', to: 'tags#index'

  root 'posts#index'
end
