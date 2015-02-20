class Admin::CategoriesController < Admin::ApplicationController

	before_filter :set_category, only: [:edit, :update]

	def index
		@categories = Category.page(params[:page]).per(10)
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_param)
		if @category.save
			flash[:notice] =  'Successfully created category'
			redirect_to admin_category_path
		else
			flash[:alert] =  'Failed to create category'
			render 'new'
		end
	end

	def edit
	end

	def update
		if @category.update_attributes(category_param)
			flash[:notice] = 'Successfully updated category'
			redirect_to admin_category_path
		else
			flash[:alert] = 'Failed to update category'
			render 'edit'
		end
	end

	private 
	def category_param 
		params.require(:category).permit(:name, 
										 :description)
	end

	def set_category 
		@category = Category.find(param[:id])
	end
end