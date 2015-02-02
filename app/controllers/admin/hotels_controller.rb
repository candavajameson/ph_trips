class Admin::HotelsController < Admin::ApplicationController

	before_filter :set_user, only: [:show, :edit, :update]

	def index
		@hotels = Hotel.page(params[:page]).per(10)
	end

	def new
		@hotel = Hotel.new
	end

	def create
		@hotel = Hotel.new hotel_params
		if @hotel.save
			flash[:success] = 'Successfully created hotel'
			redirect_to @hotel
		else
			flash[:error] = 'Unable to save hotel'
			render 'new'
		end
	end

	def edit
	end

	def update
		if @hotel.update_attributes(hotel_params)
			flash[:success] = 'Successfully updated hotel'
			redirect_to @hotel
		else
			flash[:error] = 'Unable to update hotel'
			render 'edit'
		end
	end

	def show
	end

	private 
	def hotel_params
		params.require(:hotel).permit(:name, :description, :destination_id, :address)
	end

	def set_hotel
		@hotel = Hotel.find(params[:id])
	end
end