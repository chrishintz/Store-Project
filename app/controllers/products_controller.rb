class ProductsController < ApplicationController

  def index
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
    @users = User.all
  end

  def show
    @products           = Product.all
  end

  def create
    @product = Product.new(params.require(:product).permit(:name, :description, :image_url))
    if @product.save
      redirect_to products_path
    else
      render "index"
    end
  end

  private

  def log_params
    params.require(:product).permit(:name, :description, :image_url)
  end
end
