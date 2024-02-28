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
end
