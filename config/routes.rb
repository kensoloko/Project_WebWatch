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
  get "/cart", to: "checkout#index"
  get "/checkout", to: "checkout#create"
  get "/contact", to: "static_pages#contact"
  get "/index", to: "products#index"
  get "/show", to: "products#show"
<<<<<<< HEAD
  delete "/bills/:id", to: "bills#destroy", as: "bills_destroy"
=======
  get "/rate/:id/:value", to: "products#rate"
>>>>>>> f44c4447e214350999326ef08cc3c279be08666b
  resources :users
  resources :products
  resources :comments
  resources :categories
  resources :brands
  namespace :admin do
    get "base/home"
    get "base/products"
    get "base/categories"
    get "base/users"
    get "base/brands"
    get "base/orders"
    get "base/comments"
    get "base/ratings"
    get "/login", to: "session_admin#new"
    get "/", to: "base#index"
  end
end
