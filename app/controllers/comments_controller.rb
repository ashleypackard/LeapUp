class CommentsController < ApplicationController
	before_action :correct_account,   only: :destroy

  def index
  end

  # renders new.html.erb view ( make new comment page )
	def new
		@account = Account.find(current_account)
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new
		@comments = @post.comments.all
	end

	# Action to insert new comment into database
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(comment_params)
		@comment.account_id = current_account.id
		if @comment.save
				redirect_to @post
			else
				# dont redirect if the form valication from the model fails
				# instead return to the comments page and show any errors
				render 'new'
			end
	end

	# renders show.html.erb ( show the new comment )
	def show
		@comment = Comment.find(params[:id])
	end

	# renders edit.html.erb ( edit a comment )
	def edit
		@comment = Comment.find(params[:id])
		@account = Account.find(current_account)
		@post = Post.find(@comment.post.id)
		@comments = @post.comments.all
	end

	# Action to update a comment
	def update
		@comment = Comment.find(params[:id])
		@post = Post.find(@comment.post.id)

		if @comment.update(comment_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	# Action to delete comment
	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	private
		def comment_params
			params.require(:comment).permit(:body, :account_id, :post_id)
		end

		def correct_account
      @comment = current_account.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end

