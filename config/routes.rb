Rails.application.routes.draw do
  namespace :admin do
    get "base/home"
    get "base/products"
    get "base/categories"
    get "base/users"
    get "base/brands"
    get "base/orders"
    get "base/comments"
    get "base/ratings"
    get "session/login"
  end
end
