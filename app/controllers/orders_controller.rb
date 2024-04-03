class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    carted_products = current_user.carted_products.where(status: "carted")
    subtotal = 0
    index = 0
    while index < carted_products.length
      carted_product = carted_products[index]
      subtotal += carted_product.product.price * carted_product.quantity
      index += 1
    end

    tax = subtotal * 0.09
    total = subtotal + tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total,
    )
    if @order.save
      index = 0
      while index < carted_products.length
        carted_product = carted_products[index]
        carted_product.update(status: "purchased", order_id: @order.id)
        index += 1
      end
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
    render :index
  end

  def destroy
    @order = current_user.orders.find_by(id: params["id"])
    if @order
      @order.destroy
      render json: { message: "Order deleted" }
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
