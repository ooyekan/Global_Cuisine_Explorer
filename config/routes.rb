Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'about' => 'static_pages#about'
  get 'countries/index'
  get 'countries/show'
  resources :countries, only: [:index, :show] do
    resources :cuisines, only: [:index, :show]
    resources :languages, only: [:index, :show]
    resources :reviews, only: [:index, :show, :new, :create]
  end
  resources :cuisines, only: [:index, :show]
  resources :languages, only: [:index, :show]

  resources :reviews#, only: [:show, :edit, :update, :destroy]
  root 'countries#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
