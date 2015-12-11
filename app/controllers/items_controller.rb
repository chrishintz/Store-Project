class ItemsController < ApplicationController

  def add_to_cart
    @item                     = Item.new
    @item.product_option_id   = params[:product_option_id]
    @item.price               = @item.product_option.price_in_cents
    @item.order_id            = params[:order_id]
    @item.quantity            = params[:quantity]
    @item.save    
  end

end
