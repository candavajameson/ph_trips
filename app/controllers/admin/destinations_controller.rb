class Admin::DestinationsController < Admin::ApplicationController

	before_filter :set_destination, only: [:show, :edit, :update]

	def index
		@destinations = Destination.page(params[:page]).per(10)
	end

	def new
		@destination = Destination.new
	end

	def create
		@destination = Destination.new(destination_params)
		if @destination.save()
	 		flash[:success] = "Successfully created!"
	 		redirect_to @destination
	 	else
	 		flash[:error] = "Unable to save";
	 		render 'new'
	 	end
	end

	def show
	end

	def edit
	end

	def update
		if @destination.update_attributes(destination_params) 
			flash[:success] = "Successfully updated!"
			redirect_to @destination
		else
			flash[:error] = "Unable to update destination"
			render 'edit'
		end
	end

	private
	def destination_params
		params.require(:destination).permit(:name)
	end

	def set_destination
		@destination = Destination.find(params[:id])
	end

end