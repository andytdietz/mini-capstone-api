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
      name: "Shark Vacuum",
      price: 200,
      image_url: "https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6463/6463068_sd.jpg;maxHeight=640;maxWidth=550",
      description: "A vacuum that is bloodthirsty"
    )
    render :show
  end
end
