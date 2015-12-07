class ProductsController < ApplicationController

  def index
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
    @product.name           = params[:product][:name]
    @product.description    = params[:product][:description]
    @product.image_url      = params[:product][:image_url]
    @product.save
    redirect_to products_path
  end

  private

  def log_params
    params.require(:product).permit(:name, :description, :image_url)
  end
end
