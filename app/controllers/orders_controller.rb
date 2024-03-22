class OrdersController < ApplicationController
  def create
    @order = current_user.orders.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total],
    )
    if @order.save
      render :show
    else
      render json: { errors: @order.errors.full_messages }
    end
  end

  def show
    @order = current_user.orders.find_by(id: params["id"])
    if @order
      render :show
    else
      render json: { error: "Order not found or unauthorized" }, status: :not_found
    end
  end

  def index
    @orders = current_user.orders.all
    if @orders
      render :index
    else
      render json: { error: "Order not found or unauthorized" }, status: :not_found
    end
  end

  def destroy
    @order = Order.find_by(id: params["id"])
    @order.destroy
    render json: { message: "Order successfully deleted" }
  end
end
