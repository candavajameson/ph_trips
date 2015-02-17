class Admin::GuidesController < Admin::ApplicationController

	before_filter :set_guide, only: [:edit, :update, :show]

	def index
		@guides = Guide.page(params[:page]).per(10)
	end

	def show
	end

	def new
		@guide = Guide.new
	end

	def create
		@guide = Guide.new guide_params
		@guide.user = current_user
		if @guide.save
			flash[:notice] = 'Successfully created a guide'
			redirect_to [:admin, @guide]
		else
			render 'new'
		end

	end

	def edit
	end

	def update
		if @guide.update_attributes guide_params
			flash[:notice] = 'Successfully updated guide'
			redirect_to [:admin, @guide]
		else
			render 'edit'
		end
	end

	private
	def guide_params
		params.require(:guide).permit(:title, 
									  :description, 
									  :banner,
									  category_ids: [] )
	end

	def set_guide
		@guide = Guide.find(params[:id])
	end	
end