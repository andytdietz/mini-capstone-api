class ProductsController < ApplicationController
  def first_product
    @product = Product.first
    render :show
  end

  def all_products
    @products = Product.all
    render :index
  end

  def tortilla_press
    @product = Product.find_by(name: "8 Inch Tortilla Press")
    render :show
  end

  def tiny_cowboy_hat
    @products = Product.where("name LIKE ?", "%Cowboy%")
    render :index
  end

  def product_id
    @product = Product.find_by(id: params["id"])
    render :show
  end

  def index
    @products = Product.all
    render :index
  end

  def show
    @product = Product.find_by(id: params["id"])
    render :show
  end

  def create
    @product = Product.create(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
    )
    render :show
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.update(
      name: params["name"] || @product.name,
      price: params["price"] || @product.price,
      image_url: params["image_url"] || @product.image_url,
      description: params["description"] || @product.description,
    )
    render :show
  end
end
