class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil,
    )
    if @carted_product.save
      render :show
    else
      render json: { errors: @order.errors.full_messages }, status: 422
    end
  end

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    if @carted_products
      render :index
    else
      render json: { message: { errors: @carted_products.errors.full_messages } }, status: 422
    end
  end

  def destroy
    @carted_product = current_user.carted_products.find_by(id: params["id"])
    if @carted_product.update(status: "removed")
      render json: { message: "Carted product status changed to 'removed'" }, status: :ok
    else
      render json: { error: "Failed to update carted product status" }, status: :unprocessable_entity
    end
  end
end
