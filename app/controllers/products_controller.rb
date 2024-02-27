class ProductsController < ApplicationController
  def first_product
    @product = Product.first
    render :show
  end

  def all_products
    @products = Product.all
    render :index
  end
end
