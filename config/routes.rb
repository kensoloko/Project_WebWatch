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
  resources :users do
    resources :bills
  end
  resources :products
  resources :comments
  get "/admin", to: "admin/base#index"
  post "/admin", to: "admin/base#index"
  namespace :admin do
    get "/login", to: "session_admin#new"
    post "/login", to: "session_admin#create"
    resources :products
    resources :product_images
    resources :bills
    resources :users
    resources :rates
    resources :comments, :brands, :categories, :product_images, :products do
      get "remove"
    end

    resources :brands, :categories, :comments, :products do
      collection do
        post "delete_multiple"
      end
    end

  end
end
