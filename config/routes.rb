Rails.application.routes.draw do
  root "products#index"
  get "/new", to: "products#fillter", status: "new"
  get "/hot", to: "products#fillter", status: "hot"
  get "/show", to: "products#show"
  get "/cart", to: "checkout#index"
  get "/checkout", to: "checkout#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/contact", to: "static_pages#contact"
  get "/rate/:id/:value", to: "products#rate"
  get "search(/:search)", to: "search#index", as: :search
  delete "/bills/:id", to: "bills#destroy", as: "bills_destroy"
  resources :users
  resources :products
  resources :comments
  namespace :admin do
    get "base/home"
    get "base/products"
    get "base/orders"
    get "/login", to: "session_admin#new"
    get "/", to: "base#index"
    post "/login", to: "session_admin#create"
    resources :comments do
      get "remove"
    end
    resources :brands do
      get "remove"
    end
    resources :categories do
      get "remove"
    end
    resources :users
    resources :rates
  end
end
