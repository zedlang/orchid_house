Rails.application.routes.draw do

  get 'home/index'

  root "home#index"

  devise_for :users

  resources :products
  
  namespace :admin do
    root "application#index"
  end
end
