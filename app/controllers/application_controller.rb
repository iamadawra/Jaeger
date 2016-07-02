class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :all_competitions

  private

  def all_competitions
    @all_competitions = Competition.all
  end

  def current_user
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
      if !@user
        session[:user_id] = nil
      else
        @current_user = @user
      end
    end
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
