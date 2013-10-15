class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		@comment.user_id = 1 # Will improve this soon

		if @comment.save
			redirect_to post_path(@post), notice: "Your comment was submitted"
		else
			render "posts/show"
		end
	end

	def comment_params
		params.require(:comment).permit(:body)
	end
end