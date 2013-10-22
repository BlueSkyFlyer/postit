class CommentsController < ApplicationController
before_action :require_user

	def create
		@post = Post.find_by(slug: params[:post_id])
		@comment = @post.comments.new(comment_params)
		@comment.creator = current_user

		if @comment.save
			redirect_to post_path(@post), notice: "Your comment was submitted"
		else
			render "posts/show"
		end
	end

  def vote
		post = Post.find_by(slug: params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.post = post
		Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
		redirect_to :back, notice: "Your vote was saved"
	end

	private

	def comment_params
		params.require(:comment).permit!
	end
end