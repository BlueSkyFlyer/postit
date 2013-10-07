class CategoriesController < ApplicationController
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