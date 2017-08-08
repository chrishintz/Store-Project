class SessionsController < ApplicationController

  def sign_out
    session.delete(:user_id)
    redirect_to "/", notice: "You were signed out."
  end

  def sign_in
    @user = User.find_by(email: params[:email])
    # REVIEW: Since both the if and else end up redirecting to home_path,
    #         you can leave it out of the if and just put it after
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      flash.now.alert = "Email or password is invalid"
      redirect_to home_path
    end
  end
end
