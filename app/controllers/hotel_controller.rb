class HotelController < ApplicationController

	def index
		@hotels = Hotel.all
		@hotels = @hotels.where(destination_id: params[:destination]) if params[:destination].present?
		@hotels = @hotels.page(params[:page]).per(10)
	end

	def show
		@hotel = Hotel.find(params[:id])
		@hash = Gmaps4rails.build_markers(@hotel) do |hotel, marker|
			marker.lat hotel.latitude
			marker.lng hotel.longitude
			marker.infowindow render_to_string(:partial => 'hotel/infowindow', :layout => false, :locals => { :hotel => hotel})
			marker.json({ :id => hotel.id })
		end
	end

	
end