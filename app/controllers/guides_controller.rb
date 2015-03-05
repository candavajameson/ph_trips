class GuidesController < ApplicationController

	before_filter :set_commentable, only: [:show]

	def index
		@guides = Guide.page(params[:page]).per(10)
	end

	def show
		@guide = Guide.find(params[:id])
	end

	private 
	def set_commentable
		@commentable = Guide.find(params[:id])
	end

end
