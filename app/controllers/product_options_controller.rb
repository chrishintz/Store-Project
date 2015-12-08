class ProductOptionsController < ApplicationController

  def new
    @product_options = ProductOption.new
  end

  def create
    @product_option = ProductOption.new(product_option_params)
    if @product_option.save
      redirect_to products_path
    else
      render :new
    end
  end

  private

  def product_option_params
    params.require(:product_option).permit(:name, :price_in_cents, :product_id)
  end

end
