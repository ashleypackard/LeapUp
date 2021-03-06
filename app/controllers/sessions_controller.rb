class SessionsController < ApplicationController
	skip_before_action :require_login, only: [:new, :create]
  layout 'login', :only => [:new, :create]

  def new
    redirect_to root_url if logged_in?
  end

  def create
    account = Account.find_by(email: params[:session][:email].downcase)
    if account && account.authenticate(params[:session][:password])
      log_in account
      params[:session][:remember_me] == '1' ? remember(account) : forget(account)
      redirect_back_or root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      params[:email] = params[:session][:email]
      params.delete(:session)
      render :action=> 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "You have successfully logged out."
    redirect_to login_path
  end

end
