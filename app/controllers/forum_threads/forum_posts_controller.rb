class ForumThreads::ForumPostsController < ApplicationController

	before_action :set_forum_thread

	def create
		@forum_post = @forum_thread.forum_posts.new forum_post_params
		@forum_post.user_id = current_user.id

		if @forum_post.save
			redirect_to forum_thread_path(@forum_thread, anchor: "forum_post_#{@forum_post.id}"), notice: "Succesfully posted!"
		else
			redirect_to @forum_thread, alert: "Unable to save your post"
		end
	end


	private

	def set_forum_thread
		@forum_thread = ForumThread.find(params[:forum_thread_id])
	end

	def forum_post_params
		params.require(:forum_post).permit(:body)
	end
end