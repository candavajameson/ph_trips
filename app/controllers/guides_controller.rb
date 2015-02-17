class GuidesController < ApplicationController

	def index
		@guides = Guide.page(params[:page]).per(10)
	end

	def show
		@guide = Guide.find(params[:id])
	end

end
