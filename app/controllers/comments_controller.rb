class CommentsController < ApplicationController
before_action :require_user

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		@comment.creator = current_user

		if @comment.save
			redirect_to post_path(@post), notice: "Your comment was submitted"
		else
			render "posts/show"
		end
	end

  def vote
		Vote.new(voteable: @comment, creator: current_user, vote: params[:vote])

		if @vote.save
		  redirect_to :back, notice: "Your vote was saved"
		else
			render "posts/show"
		end
	end

	private

	def comment_params
		params.require(:comment).permit!
	end
end