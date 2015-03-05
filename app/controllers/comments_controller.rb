class CommentsController < ApplicationController
	
	before_filter :authenticate_user!

	def create
		@context = context
		@comment = @context.comments.new comment_params
		@comment.user = current_user

		if @comment.save
			redirect_to context_url(context), notice: "Your comment is successfully posted."
		else
			redirect_to context_url(context), alert: "Failed to post comment."
		end

	end

	private 
	def comment_params
		params.require(:comment).permit(:body)
	end

	def context
		if params[:hotel_id]
			id = params[:hotel_id]
			Hotel.find(params[:hotel_id])
		elsif params[:blog_id] 
			Blog.find(params[:blog_id])
		else
			Guide.find(params[:guide_id])
		end
	end

	def context_url(context)
		if Hotel === context
			hotel_path(context)
		elsif Blog === context
			blog_path(context)
		else
			guide_path(context)
		end
	end

end