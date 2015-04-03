class AccountsController < ApplicationController
	layout 'login', only: [:new]
	skip_before_action :require_login, only: [:new, :create]
	before_action :validate_correct_account, only: [:edit, :update, :destroy]

  def index
  end

  def home
  	@recent_posts = current_account.posts.sort_by_date(:desc).take(5)
  	@related_posts = []
  	current_account.categories.each do |category|
  		category.posts.sort_by_date(:desc).take(3).each { |post| @related_posts.push(post) if post.account != current_account }
  	end
  	@related_posts.shuffle!
  end

  # renders new.html.erb view ( register page )
	def new
		redirect_to current_user if logged_in?
		@account = Account.new
	end

	# Action to insert new user into database
	def create
		@account = Account.new(account_params)
		if @account.save
				log_in @account
				redirect_to @account
			else
				# dont redirect if the form validation from the model fails
				# instead return to the articles page and show any errors
				render 'new', layout: "login"
			end
	end

	# renders show.html.erb ( a users profile page )
	def show
		@account = Account.find(params[:id])
		@posts_list = @account.posts.sort_by_date(:desc).paginate(page: params[:page], :per_page => 10)
		@category_list = @account.categories
	end

	# renders edit.html.erb ( account settings page )
	def edit
		@account = Account.find(params[:id])
		@categories = Category.all
	end

	# Action to update account settings
	def update		
		@account = Account.find(params[:id])
		@account.updating_password = false

		if @account.update_attributes(edit_account_params)
			flash[:success] = "Your account settings have been successfully updated."
			redirect_to @account
		else
			render 'edit'
		end
	end

	def update_password
		@account = Account.find(params[:id])
		@account.updating_password = true

		if @account.update_attributes(change_password_params)
			flash[:success] = "Your password has been successfully updated."
			redirect_to @account
		else
			render 'edit'
		end
	end

	def update_categories
		@account = Account.find(params[:id])
		@account.account_categories.delete_all

		if params[:categories]
			params[:categories].each do |category|
				@account.account_categories.create(category_id: category)
			end
		end

		flash[:success] = "Your interests have been successfully updated."
		redirect_to @account
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

		def change_password_params
			params.require(:account).permit(:password, :password_confirmation)
		end

		def edit_account_params
			params.require(:account).permit(:first_name, :last_name, :description)
		end

		def validate_correct_account
		  @account = Account.find(params[:id])
      redirect_to(root_url) unless current_account?(@account)
	  end

end
