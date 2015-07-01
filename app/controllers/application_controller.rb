class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  protected
  def authenticate_user
  	unless session[:userid]
      flash = {}
  		redirect_to sessions_path, alert: "Authenticate user needed here!"
  		return false
  	else
      # set current_user by the current user object
      # @current_user = User.find session[:userid] 
  		return true
  	end
  end

  def authenticate_admin
    unless current_user.role == "admin"
      redirect_to users_path, :notice => "Authenticated admin needed here!"
    end
  end

  #This method for prevent user to access Signup & Login Page without logout
  def save_login_state
    if session[:userid]
      flash = {}
      redirect_to users_path, alert: "You already login as #{current_user.username}"
      return false
    else
      return true
    end
  end

  private
  def current_user
    @current_user ||= User.find(session[:userid]) if session[:userid]
  end
end
