class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)

		if @comment.save
			flash[:notice] = "Your comment was submitted"
			redirect_to post_path(@post)
		else
			@post.reload
			render "posts/show"
		end
	end

	def comment_params
		params.require(:comment).permit!
	end
end