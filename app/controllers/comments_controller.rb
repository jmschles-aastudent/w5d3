class CommentsController < ApplicationController

	def create
		@comment = current_user.authored_comments.build(params[:comment])
		@link = @comment.link
		if @comment.save
			redirect_to comment_url(@comment)
		else
			redirect_to link_url(@comment.link)
		end
	end

	def show
		@comment = Comment.find(params[:id])
		@link = @comment.link
	end

end
