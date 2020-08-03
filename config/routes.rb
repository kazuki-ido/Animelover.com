Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/show'
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]
  resources :posts, only: [:index, :show, :create] do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end

  resources :relationships, only: [:create, :destroy]
  get '/mypage' => 'users#mypage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
