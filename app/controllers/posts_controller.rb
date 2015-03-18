class PostsController < ApplicationController

  def index
  	@posts = Post.all.paginate(page: params[:page], :per_page => 15)
  end

  # renders new.html.erb view ( make new post page )
	def new
		@post = Post.new
	end

	# Action to insert new post into database
	def create
		@post = Post.new(post_params)
		if @post.save
				redirect_to @post
			else
				# dont redirect if the form valication from the model fails
				# instead return to the posts page and show any errors
				render 'new'
			end
	end

	# renders show.html.erb ( show the new post )
	def show
		@post = Post.find(params[:id])
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
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to view_feed_path # TODO: Once the "View Feed" page is implemented put the correct path here.
	end

	private
		def post_params
			params.require(:post).permit(:title, :body, :location, :meeting_date, :meeting_time, :account_id, :category_id)
		end
end
