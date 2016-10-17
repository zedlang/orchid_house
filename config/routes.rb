Rails.application.routes.draw do

  root 'page#home'

  get 'page/about'
  get 'page/contact'
  get 'page/faq'
  get 'page/show'

  devise_for :users
  devise_scope :user do
    get "user_root" => "page#show"
  end

  resources :charges, only: [:new, :create]

  resources :messages

  resources :orders

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
