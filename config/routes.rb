Rails.application.routes.draw do
  root "products#index"
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
  get "/index", to: "products#index"
  get "/show", to: "products#show"
  resources :users
  resources :products
  resources :categories
  resources :brands do
     get "delete"
  end
  namespace :admin do
    get "base/home"
    get "base/products"
    get "base/categories"
    get "base/users"
    get "base/orders"
    get "base/comments"
    get "base/ratings"
    get "/login", to: "session_admin#new"
    get "/", to: "base#index"
    post "/login", to: "session_admin#create"
    # get "brands/index"
    resources :brands  do
      get "/brands/delete"
      post "create"
    end
  end
end
