class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  helper_method :current_user

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin?
  	current_user.admin?
  end

  def signed_in?
  	!current_user.nil?
  	#when not signed in current_user is nil
  end

end
