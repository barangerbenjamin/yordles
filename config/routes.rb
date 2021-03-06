Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: :show
  resources :games, only: :show
  resources :attempts, only: :update
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
