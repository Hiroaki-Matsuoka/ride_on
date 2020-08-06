Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  get "joins/index" => "joins#index"
  post "joins/:ride_id/create" => "joins#create"
  post "joins/:ride_id/destroy" => "joins#destroy"
  root to: 'staticpages#home'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
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
