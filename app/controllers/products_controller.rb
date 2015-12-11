class ProductsController < ApplicationController
  before_action :authorize_admin, except: [:index, :show_customer]

  def index
    @users    = User.all
    @products = Product.all
  end

  def show
    @products           = Product.all
  end

  def show_customer
    @product      = Product.find(params[:id])
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
    @product                          = Product.find(params[:id])
    @product_option                   = @product.product_options.new
    @product_options                  = @product.product_options.all
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
