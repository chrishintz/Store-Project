class ProductsController < ApplicationController

  def index
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
    @users    = User.all
    @products = Product.all
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

  def delete
    @product    = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def edit
    @product                = Product.find(params[:id])
  end

  def update
    @product                = Product.find(params[:id])
    @product.name           = params[:name]
    @product.description    = params[:description]
    @product.image_url      = params[:image_url]
    if @product.save
      redirect_to products_path
    else
      render update
    end
  end

  private

  def log_params
    params.require(:product).permit(:name, :description, :image_url)
  end
end
