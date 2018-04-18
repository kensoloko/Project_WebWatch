Rails.application.routes.draw do
  root "products#index"
  get "/search", to: "search#index"
  post "/search", to: "search#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/fillter", to: "products#fillter"
  get "/new", to: "products#fillter", status: "new"
  get "/hot", to: "products#fillter", status: "hot"
  get "/categories", to: "products#fillter", status: "categories"
  get "/brands", to: "products#fillter", status: "brands"
  get "/cart", to: "checkout#index"
  get "/checkout", to: "checkout#create"
  get "/contact", to: "static_pages#contact"
  get "/index", to: "products#index"
  get "/show", to: "products#show"
  delete "/bills/:id", to: "bills#destroy", as: "bills_destroy"
  get "/rate/:id/:value", to: "products#rate"
  resources :users
  resources :products
  resources :comments
  get "/admin", to: "admin/base#home"
  namespace :admin do
    get "/home", to: "base#home"
    get "/products", to: "base#products"
    get "/categories", to: "base#categories"
    get "/users", to: "base#users"
    get "/orders", to: "base#orders"
    get "/comments", to: "base#comments"
    get "/ratings", to: "base#ratings"
    get "/login", to: "session_admin#new"
    post "/login", to: "session_admin#create"
    # get "brands/index"
    resources :brands
    resources :bills
  end
end
