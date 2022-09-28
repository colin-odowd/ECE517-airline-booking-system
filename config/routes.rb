Rails.application.routes.draw do
  get 'home/index'
  resources :baggages
  resources :reservations
  resources :flights
  resources :users

  resources :reservations do
    resources :baggages, only: :index
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: "users#new", as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  get 'logout', to: "sessions#destroy", as: 'logout'
end
