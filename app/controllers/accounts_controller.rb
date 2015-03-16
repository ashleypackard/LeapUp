class AccountsController < ApplicationController
	layout 'login', only: [:new]
	skip_before_filter :logged_in_user, only: [:new, :create]

  def index
  end

  def home
  end

  # renders new.html.erb view ( register page )
	def new
		@account = Account.new
	end

	# Action to insert new user into database
	def create
		@account = Account.new(account_params)
		if @account.save
				log_in @account
				redirect_to @account
			else
				# dont redirect if the form valication from the model fails
				# instead return to the articles page and show any errors
				render 'new', layout: "login"
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

		if @account.update_attributes(edit_account_params)
			redirect_to @account
		else
			render 'edit'
		end
	end

	# Action to delete account
	def destroy
		@account = Account.find(params[:id])
		@account.destroy
		flash[:success] = "You have successfully deleted your account."
		redirect_to login_path
	end

	private
		def account_params
			params.require(:account).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end

		def edit_account_params
			params.require(:account).permit(:first_name, :last_name, :description)
		end

		def change_password_params
			params.require(:account).permit(:password, :password_confirmation)
		end

end
