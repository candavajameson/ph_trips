class HotelController < ApplicationController

	def show
		@hotel = Hotel.find(params[:id])
	end
	
end