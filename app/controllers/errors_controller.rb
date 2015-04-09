class ErrorsController < ApplicationController
  layout :choose_layout
  skip_before_action :require_login

  def file_not_found

  end

  def unprocessable
  end

  def internal_server_error
  end

   private 
  	def choose_layout
 			logged_in? ? 'application' : 'login'
		end

end
