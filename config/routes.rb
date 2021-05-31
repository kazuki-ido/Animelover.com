Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/show'
  get 'home/terms'
  get "users/home/terms" => "home#terms"
  get "posts/home/terms" => "home#terms"
  devise_for :users

  resources :users, only: [:index, :show, :update,:edit]
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments
end


  resources :relationships, only: [:create, :destroy]
  get '/mypage' => 'users#mypage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
