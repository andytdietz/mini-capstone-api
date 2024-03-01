Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/first_product", controller: "products", action: "first_product"
  get "/all_products", controller: "products", action: "all_products"
  get "/tortilla_press", controller: "products", action: "tortilla_press"
  get "/tiny_cowboy_hat", controller: "products", action: "tiny_cowboy_hat"
  get "/product/:id", controller: "products", action: "product_id"
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  # Defines the root path route ("/")
  # root "posts#index"
end
