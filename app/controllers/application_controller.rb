class ApplicationController < ActionController::Base
    #helper makes the method available to the view
    helper_method :current_user
    before_action :authorized
    helper_method :logged_in?
  
    def current_user
      if session[:user_id]
        @current_user ||= User.find_by_id(session[:user_id])
      else
        @current_user = nil
      end
    end
  
    def logged_in?
      !current_user.nil?
    end

    def ensure_admin
      if !current_user.admin
        raise ActiveRecord::RecordNotFound, "Not found"
      end
    end
   
    def authorized
      redirect_to root_path unless logged_in?
    end
end
