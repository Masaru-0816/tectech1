Rails.application.routes.draw do
  devise_for :users
  root 'top#index'  

  resources :users, only: [:edit, :update]
  resources :kids, only: [:index] 
    namespace :admin do
      resources :kids, only: [:index, :new, :create, :show,  :edit, :destroy]
    end
end
