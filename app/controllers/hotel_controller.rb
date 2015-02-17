class HotelController < ApplicationController

	def index
		
		@hotels = Hotel.all

		if params[:destination].present?
			destination = Destination.where(name: params[:destination])
			@hotels = @hotels.where(destination_id: destination.first.id)
		end

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