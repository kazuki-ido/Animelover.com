Rails.application.routes.draw do
  get 'users/show'
  resources :posts do
    resources :comments
  end
  root to: 'home#index'
  get 'home/show'
  devise_for :users
  
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :show, :create] do
    resources :likes, only: [:create, :destroy]
  end
  
  resources :relationships, only: [:create, :destroy]
  resources :users, :only => [:show]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
