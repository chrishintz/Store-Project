class UsersController < ApplicationController

  def create
      # Should the below be password_digest or password and password_confirmation?
    @user = User.new(params.require(:users).permit(:email, :password_digest))
    @user.save
    session[:user_id] = @user.id
    redirect_to home_path
  end
end
