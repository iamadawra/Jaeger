class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  @@CDN_DNS = "http://d3bowxm1hun7br.cloudfront.net/"
  helper_method :current_user, :all_competitions, :current_competition, :full_url

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

  def current_competition
    if session[:competition_id]
      Competition.find(session[:competition_id])
    else
      Competition.find(1)
    end
  end

  def full_url(ori_address)
    "#@@CDN_DNS" + ori_address
  end
end
