Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get "joins/index" => "joins#index"
  post "joins/:ride_id/create" => "joins#create"
  post "joins/:ride_id/destroy" => "joins#destroy"
  root to: 'staticpages#home'
  resources :rides do
    resources :joins
  end
  get "user_rides/:id" => "rides#user_rides"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
