class PostsController < ApplicationController

	before_action :correct_account,   only: :destroy

  def index
  	@posts = Post.all.paginate(page: params[:page], :per_page => 15)
  end

    # renders new.html.erb view ( make new post page )
	def new
		@account = Account.find(params[:account_id])
		@post = @account.posts.new
	end

	# Action to insert new post into database
	def create
		@post = current_account.posts.build(post_params)
		if @post.save
				redirect_to posts_path
			else
				# dont redirect if the form valication from the model fails
				# instead return to the posts page and show any errors
				render 'new'
			end
	end

	# renders show.html.erb ( show the new post )
	def show
		@post = Post.find(params[:id])
		@comments = @post.comments.all
	end

	# renders edit.html.erb ( edit a post )
	def edit
		@post = Post.find(params[:id])
	end

	# Action to update a post
	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	# Action to delete post
	def destroy
		@post.destroy
		flash[:success] = "Post deleted"
		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :body, :location, :meeting_date, :meeting_time, :category_id)
		end

		def correct_account
      @post = current_account.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
