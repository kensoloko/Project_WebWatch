Rails.application.routes.draw do
  root "products#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/fillter", to: "products#fillter"
  get "/fillter/:status", to: "products#fillter", as: "new"
  get "/cart", to: "checkout#index"
  get "/checkout", to: "checkout#create"
  get "/contact", to: "static_pages#contact"
  get "/index", to: "products#index"
  get "/show", to: "products#show"
  get "/rate/:id/:value", to: "products#rate"
  get "search(/:search)", to: "search#index", as: :search
  delete "/bills/:id", to: "bills#destroy", as: "bills_destroy"
  resources :users
  resources :products
  resources :comments
  resources :categories
  resources :brands
  namespace :admin do
    get "base/home"
    get "base/products"
    get "base/orders"
    get "base/comments"
    get "base/ratings"
    get "/login", to: "session_admin#new"
    get "/", to: "base#index"
    post "/login", to: "session_admin#create"
    # get "brands/index"
    resources :brands  do
      get "remove"
    end
    resources :categories do
      get "remove"
    end
    resources :users
  end
end
