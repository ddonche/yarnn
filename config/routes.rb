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
  resources :users
  get 'static_pages/home'
  get 'static_pages/help'
  get 'tags/:tag', to: 'tags#show', as: :tag
  get 'tags', to: 'tags#index'
  put 'ipsum', to: "words#generate_ipsum"

  root 'posts#index'
end
