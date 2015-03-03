class SessionsController < ApplicationController

  def new
  end

  def create
    account = Account.find_by(email: params[:session][:email].downcase)
    if account && account.authenticate(params[:session][:password])
      log_in account
      params[:session][:remember_me] == '1' ? remember(account) : forget(account)
      redirect_to account
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  # Forgets a persistent session.
  def forget(account)
    account.forget
    cookies.delete(:account_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current account.
  def log_out
    forget(current_account)
    session.delete(:account_id)
    @current_account = nil
  end
end
