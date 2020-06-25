class ApplicationController < ActionController::Base
  helper_method [:current_user, :logged_in?]

  private

    def login(user)
      session[:user_id] = user.id
    end

    def logout
      session.delete(:user_id)
      @current_user = nil
    end
     

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !current_user.nil?
    end

    def authenticate
      redirect_to login_path, alert: 'You must login to access that page' unless logged_in?
    end
end
