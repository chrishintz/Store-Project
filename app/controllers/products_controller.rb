class ProductsController < ApplicationController

  def index
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
    @users = User.all
  end

end
