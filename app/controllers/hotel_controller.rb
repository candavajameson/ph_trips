class HotelController < ApplicationController

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