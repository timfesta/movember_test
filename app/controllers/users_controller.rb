class UsersController < ApplicationController

	def show
		@users = User.find(params[:id])
	end

	def new
		@users = User.new
	end

	def create
		@users = User.new(user_params)
		if @users.save
			redirect_to @users
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
