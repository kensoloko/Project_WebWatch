Rails.application.routes.draw do
  root "products#products"
  get "/search", to: "search#index"
  post "/search", to: "search#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/products", to: "products#products"
  get "/checkout", to: "users#checkout"
  get "/contact", to: "static_pages#contact"
  resources :users
end
