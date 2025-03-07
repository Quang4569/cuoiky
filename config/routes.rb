
Rails.application.routes.draw do
  root "products#index"

  # Session routes
  get "session/new", to: "sessions#new", as: :new_session
  post "session", to: "sessions#create"

  # Password routes
  resources :passwords, param: :token

  # Product routes
  resources :products do
    resources :subscribers, only: [ :create ]
  end
end
