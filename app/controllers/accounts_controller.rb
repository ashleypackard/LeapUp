class AccountsController < ApplicationController
	layout 'login', :only => [:new, :index]

  def index
  end

  def login
  end

  def logout
  end

  # renders new.html.erb view ( register page )
	def new
		@account = Account.new
	end

	# Action to insert new user into database
	def create
		@account = Account.new(account_params)
		if @account.save
				redirect_to @account
			else
				# dont redirect if the form valication from the model fails
				# instead return to the articles page and show any errors
				render 'new'
			end
	end

	# renders show.html.erb ( a users profile page )
	def show
		@account = Account.find(params[:id])
	end

	# renders edit.html.erb ( account settings page )
	def edit
		@account = Account.find(params[:id])
	end

	# Action to update account settings
	def update
		@account = Account.find(params[:id])

		if @account.update(account_params)
			redirect_to @account
		else
			render 'edit'
		end
	end

	# Action to delete account
	def destroy
		@account = Account.find(params[:id])
		@account.destroy
		redirect_to new_account_path # TODO: We really want this to go back to log in page
	end

	private
		def account_params
			params.require(:account).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end
end
