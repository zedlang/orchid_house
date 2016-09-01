Rails.application.routes.draw do

  get 'home/index'

  root "home#index"

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :products, only: [:index, :show]
  
  namespace :admin do
    root "application#index"

    resources :products, only: [:new, :create, :edit, :update, :destroy]
  end
end
