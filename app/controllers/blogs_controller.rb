class BlogsController < ApplicationController

	before_filter :authenticate_user!, except: [:index]
	before_filter :set_blog, only: [:edit, :update, :show]

	def index
		@blogs = Blog.page(params[:page]).per(10)
	end

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.user_id = current_user

		if @blog.save
			flash[:success] = 'Successfully save the blog'
			redirect_to @blog
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @blog.update_attributes(blog_params)
			flash[:success] = 'Successfully updated blog'
			redirect_to @blog
		else
			render 'edit'
		end
	end

	def show
	end

	private 
	def blog_params
		params.require(:blog).permit(:title, :content, :excerpt, 
														:banner)
	end

	def set_blog
		@blog = Blog.find(params[:id])
	end

end