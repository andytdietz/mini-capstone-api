class OrdersController < ApplicationController
  def create
    if current_user
      @order = current_user.orders.new(
        product_id: params[:product_id],
        quantity: params[:quantity],
      )
      if @order.save
        render :show
      else
        render json: { errors: @order.errors.full_messages }
      end
    else
      render json: { error: "You must be logged in to create an order" }, status: :unauthorized
    end
  end

  def show
    if current_user
      @order = current_user.orders.find_by(id: params["id"])
      if @order
        render :show
      else
        render json: { error: "Order not found or unauthorized" }, status: :not_found
      end
    else
      render json: { error: "Order not found or unauthorized" }, status: :unauthorized
    end
  end

  def index
    if current_user
      @orders = current_user.orders.all
      render :index
    else
      render json: { error: "Order not found or unauthorized" }, status: :unauthorized
    end
  end

  def destroy
    @order = current_user.orders.find_by(id: params["id"])
    if @order
      @order.destroy
      render json: { message: "Order successfully deleted" }
    else
      render json: { error: "Order not found or unauthorized" }, status: :not_found
    end
  end

  def update
    @order = current_user.orders.find_by(id: params["id"])
    if @order
      @order.update(
        product_id: params["product_id"] || @order.product_id,
        quantity: params["quantity"] || @order.quantity,
        subtotal: params["subtotal"] || @order.subtotal,
      )
      render :show
    else
      render json: { error: "Order not found or unauthorized" }, status: :not_found
    end
  end
end
