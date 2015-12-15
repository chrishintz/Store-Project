class ItemsController < ApplicationController

  def add_to_cart
    @item                     = Item.new
    @item.product_option_id   = params[:product_option_id]
    @item.price               = product_option.price_in_cents
    @item.order_id            = params[:order_id]
    @item.quantity            = 1
    @item.save
      redirect_to cart_path
  end

  private

  def item_params
    params.require(:item).permit(:order_id, :product_option_id, :price, :quantity)
  end
end
