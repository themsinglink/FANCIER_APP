Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  resources :users, only: [:show] do                           # member => restaurant id in URL
    resources :reviews, only: [:index, :new, :create]
  end

  resources :articles, only: [:index, :new, :create, :show, :edit, :update]
  resources :orders, only: [:show, :create, :edit, :update] do

  end


  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  resources :tags, only: [:show]

  resources :favorites, only: :index




  get :autocomplete, to: 'pages#autocomplete'
  get "dashboard", to: 'pages#dashboard'
  get "listings", to: 'pages#listings'
  get "about", to: 'pages#about'
  get "shop", to: 'articles#index'


end
