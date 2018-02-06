class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :require_login

  def current_user
  	User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  private
    def require_login
      if session[:user_id] == nil
        redirect_to users_path
      end
    end
end
