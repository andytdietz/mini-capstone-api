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
end
