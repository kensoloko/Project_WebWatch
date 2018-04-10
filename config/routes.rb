Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  root "users#new"
  get "/signup", to: "users#new"
  post "/signup",  to: "users#create"
  get "/products", to: "users#products"
  resources :users
end
