class CompanyController < ApplicationController
  layout :choose_layout
  skip_before_action :require_login

  def index
  end
  
  def show
  end
  
  private 
  	def choose_layout
 			logged_in? ? 'application' : 'login'
		end

end