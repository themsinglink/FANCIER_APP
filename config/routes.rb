Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  resources :users, only: [:show]

  resources :articles, only: [:index, :new, :create, :show]
  resources :orders, only: [:show, :create] do
    resources :reviews, only: [:new, :create]

    resources :payments, only: :new
  end

  resources :tags, only: [:show]

  namespace :sellers do
    resources :orders, only: :update
  end

  namespace :buyers do
    resources :orders, only: :update
  end





  get :autocomplete, to: 'pages#autocomplete'
  get "dashboard", to: 'pages#dashboard'
  get "listings", to: 'pages#listings'
  get "about", to: 'pages#about'
  get "shop", to: 'articles#index'


end
