Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "example.com", "localhost:5173", "mini-capstone-frontend-fv7i.onrender.com/products.json"
    resource "*", headers: :any, methods: [:get, :post, :patch, :put, :delete]
  end
end
