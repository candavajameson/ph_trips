class Admin::CategoriesController < Admin::ApplicationController

	before_filter :only [:edit, :update]

	def index
		@categories = Category.page(params[:page]).per(10)
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_param)
		if @category.save
			flash[:success] = 'Successfully created category'
			@category
		else
			flash[:error] = 'Category is not saved'
			render 'new'
		end
	end

	def edit
	end

	def update
		if @category.update_attributes(category_param)
			flash[:success] = 'Successfully updated category'
			redirect_to @category
		else
			render 'edit'
		end
	end

	private 
	def category_param 
		params.require(:category).permit(:name)
	end

	def set_category 
		@category = Category.find(param[:id])
	end
end