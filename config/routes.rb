Rails.application.routes.draw do
  devise_for :users
  root 'top#index'  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :users, only: [:edit, :update]
  resources :kids, only: [:index] 
    namespace :admin do
      resources :kids, only: [:index, :new, :create, :edit, :update, :destroy]
    end
end
