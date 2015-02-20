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
			flash[:notice] =  'Successfully created destination'
	 		redirect_to admin_destination_path @destination
	 	else
	 		render 'new'
	 	end
	end

	def show
	end

	def edit
	end

	def update
		if @destination.update_attributes(destination_params) 
			flash[:notice] = 'Successfully updated destination';
			redirect_to admin_destination_path @destination
		else
			flash[:alert] = 'Failed to update destination'
			render 'edit'
		end
	end

	private
	def destination_params
		params.require(:destination).permit(:name, 
											:description)
	end

	def set_destination
		@destination = Destination.find(params[:id])
	end

end