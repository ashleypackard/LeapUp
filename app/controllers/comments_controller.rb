class CommentsController < ApplicationController

  def index
  end

  # renders new.html.erb view ( make new comment page )
	def new
		@comment = Comment.new
	end

	# Action to insert new comment into database
	def create
		@comment = Comment.new(comment_params)
		if @comment.save
				redirect_to @comment
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
	end

	# Action to update a comment
	def update
		@comment = Comment.find(params[:id])

		if @comment.update(comment_params)
			redirect_to @comment
		else
			render 'edit'
		end
	end

	# Action to delete comment
	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to view_feed_path # TODO: Once the sessions are implemented we'll want to redirect to the post the comment was made on
	end

	private
		def comment_params
			params.require(:comment).permit(:body, :account_id, :post_id)
		end
end

