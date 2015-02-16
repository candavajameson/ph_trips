class DashboardController < ApplicationController	
	
	def index
		@hotels = Hotel.order('created_at DESC').limit(5)
		@blogs = Blog.order('created_at DESC').limit(10)
		@guides = Guide.order('created_at DESC').limit(5)
	end

end