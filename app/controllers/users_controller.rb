class UsersController < ApplicationController

	def show
		@current_user = User.find(session[:user_id])
		# `
	end

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save
			# redirect_to @users
			session[:user_id] = user.id
			redirect_to profile_path
		else
			render 'new'
		end
	end

	def edit
		@users = User.find(params[:id])
	end

	def update
		@users = User.find(params[:id])
		if @users.update_attributes(user_params)
			redirect_to @users
		else 
			render 'edit'
		end
		
	end

	private
	def user_params
		params.require(:user).permit(:name, :email)
	end
end
