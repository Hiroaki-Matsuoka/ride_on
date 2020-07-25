Rails.application.routes.draw do
  devise_for :users
  root to: 'rides#index'
  resources :rides
  resources :users, only: :show
end
