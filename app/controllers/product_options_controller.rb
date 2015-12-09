class ProductOptionsController < ApplicationController

  def new
    @product_options = ProductOption.all
  end

  def create
    # @product_options = ProductOption.all
    @product_option  = ProductOption.new(product_option_params)
    if @product_option.save
      redirect_to product_options_path
    else
      render :new
    end
  end

  def delete
    @product_option    = ProductOption.find(params[:id])
    @product_option.destroy
    redirect_to product_options_path(params[:product_id])
  end

  private

  def product_option_params
    params.require(:product_option).permit(:name, :price_in_cents, :product_id)
  end

end
