class OrdersController < ApplicationController

  def index
    # REVIEW: I like aligning this, but these two lines are pushed too far out.
    @orders                           = Order.all
  end

  def cart
    @orders                           = Item.where(order_id: session[:user_id])
  end

  def finish_checkout
    @order  = Order.new(order_params)
    if @order.save
      raise
      redirect_to order_confirm_path
    else
      render :index
    end
  end

  def confirm
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :name, :shipping_address, :status, :total)
  end

end
