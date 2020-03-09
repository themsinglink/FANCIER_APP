Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  resources :users, only: [:show] do                           # member => restaurant id in URL
    resources :reviews, only: [:index, :new, :create]
    resources :favorites, only: [:index]
  end

  resources :articles, only: [:index, :new, :create, :show, :edit, :update] do
    resources :favorites, only: [:create, :destroy]
  end
  resources :orders, only: [:show, :create, :edit, :update] do

  end


  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
    resources :reviews, only: [:new, :create]
  end

  resources :tags, only: [:show]





  get :autocomplete, to: 'pages#autocomplete'
  get "dashboard", to: 'pages#dashboard'
  get "listings", to: 'pages#listings'
  get "about", to: 'pages#about'
  get "shop", to: 'articles#index'


end
