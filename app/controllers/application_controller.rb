class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :require_login

  private
		# Confirms a logged-in user.
	  def require_login
	    unless logged_in?
	    	store_location
	      flash[:danger] = "Please log in to access this part of the site."
	      redirect_to login_path
	    end
	  end

end
