class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:index, :show]

  def index
    @posts = Post.all.sort_by {|x| x.total_votes}.reverse
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user
    if @post.save
      flash[:notice] = "Your post was saved."
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
    	flash[:notice] = "This post was updated!"
    	redirect_to post_path(@post)
    else
    	render :edit
    end
  end

  def vote 
    @post = Post.find_by(slug: params[:id])
    @vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def post_params
  	params.require(:post).permit!
  end

  def set_post
    @post = Post.find_by(slug: params[:id])
  end
end
