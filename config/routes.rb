Rails.application.routes.draw do
  get 'like/create'
  get 'like/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'category/:category_name', to: 'coffees#category', as: 'category'
  get 'search', to: 'coffees#search'
  get 'ocr', to: 'photos#ocr'
  get 'photos', to: 'photos#index'
  post 'photos', to: 'photos#create'
  get 'liked_coffees/:id', to: 'coffees#liked_coffees', as: 'liked_coffees'
  get 'my_coffees/:id', to: 'coffees#my_coffees', as: 'my_coffees'
  get 'my_reviews/:id', to: 'coffees#my_reviews', as: 'my_reviews'
  get 'map', to: 'coffees#coffee_map', as: 'coffee_map'

  resources :coffees do
    post 'toggle_like', to: 'likes#toggle'
    resources :reviews, only: [:create, :new, :update, :edit]
  end

  resources :users, only: [:index, :show, :update] do
    member do
      post :follow
      post :unfollow
    end
  end

  resources :reviews, only: [:index, :destroy] do
    post 'toggle_review_like', to: 'review_likes#toggle'
  end
end
