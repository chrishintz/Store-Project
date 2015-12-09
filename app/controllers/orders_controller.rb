class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def cart
    @orders      = Item.where(order_id: session[:user_id])
  end

  def checkout
    @current_order.total = @current_oder.calculate_total
  end

  def finish_checkout
    @current_order.name               = params[:order][:name]
    @current_order.shipping_address   = params[:order][:shipping_address]
    @current_order.save
    redirect_to order_confirm_path
  end
end
