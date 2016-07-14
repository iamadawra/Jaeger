class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to root_url
    else
      #flash.now.alert = "Invalid email or password"
      redirect_to login_url
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url
  end
end
