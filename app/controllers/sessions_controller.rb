class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to links_path
    else
      flash[:error] = "Oops! Your login was invalid. Please check your email is valid and passwords match."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You are logged out."
    redirect_to login_path
  end
end
