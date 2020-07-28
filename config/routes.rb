Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'staticpages#home'
  resources :rides
  resources :users
  resources :microposts, only: [:create, :destroy]
end
