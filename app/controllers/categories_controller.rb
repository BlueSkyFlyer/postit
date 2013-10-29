class CategoriesController < ApplicationController
  before_action :require_user, except: [:show]
  before_action :require_admin, only: [:create]

  def index
  	@categories = Category.all
  end

  def show
  	@category = Category.find(params[:id])
  end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params.require(:category).permit(:name))
		if @category.save
			redirect_to posts_path, notice: "Category was created"
		else
			render :new
		end
	end
end