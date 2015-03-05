class HotelController < ApplicationController

	before_filter :set_commentable, only: [:show]

	def index
		
		@hotels = Hotel.all

		if params[:destination].present?
			destination = Destination.find_by(name: params[:destination])
			@hotels = @hotels.where(destination_id: destination.id)
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

	private
	def set_commentable
		@commentable = Hotel.find(params[:id])
	end
	
end