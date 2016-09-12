Rails.application.routes.draw do

  get 'home/index'

  root "home#index"

  devise_for :users

  resources :products, only: [:index, :show]
  
  namespace :admin do
    root "application#index"

    resources :products, only: [:new, :create, :edit, :update, :destroy]
  end

  resource :basket, only: [:show] do
    put 'add/:product_id', to: 'baskets#add', as: :add_to
    put 'remove/:product_id', to: 'baskets#remove', as: :remove_from
    put 'empty', to: 'baskets#empty', as: :empty
  end
end
