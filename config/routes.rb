Rails.application.routes.draw do
  get 'like/create'
  get 'like/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'category', to: 'coffees#category'
  get 'search', to: 'coffees#search'

  resources :coffees, only: [:index, :show] do
    resources :likes, only: [:create, :destroy]
    resources :reviews, only: [:create, :new, :update, :edit]
  end

  resources :users, only: [:index, :show, :update] do
    member do
      post :follow
      post :unfollow
    end
  end

  resources :reviews, only: [:index, :destroy] do
    resources :review_likes, only: [:create]
  end
  resources :review_likes, only: :destroy
end
