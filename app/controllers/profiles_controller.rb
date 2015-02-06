class ProfilesController < ApplicationController
	
	before_filter :set_user

	def show
	end


	def update
		if @user.update_attributes(user_params)
			flash[:notice] = 'Profile was successfully updated'
		else
			render 'show'
		end
	end

	private 
	def user_params
		params.require(:user).permit(:name, :email)
	end

	def set_user
		@user = current_user
	end
end