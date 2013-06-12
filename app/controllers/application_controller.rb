class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  def require_login
  	unless logged_in?
  		redirect_to new_session_url
  	end
  end

  def login(user)
  	user.generate_session_token!
  	session[:session_token] = user.session_token
  end

  def logout(user)
  	user.destroy_session_token!
  	session[:session_token] = nil
  end

  def current_user
  	return nil unless session[:session_token]
  	@current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
  	!!current_user
  end
end
