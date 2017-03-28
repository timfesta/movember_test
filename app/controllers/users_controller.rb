class UsersController < ApplicationController

	def index
		@user = User.all	
	end

	def new
		if current_user
			redirect_to profile_path
		else
			@user = User.new
			render :new
		end
		
	end

	def create
		if current_user 
			redirect_to profile_path
		else
			user = User.new(user_params)
			if user.save
				# redirect_to @users
				session[:user_id] = user.id
				redirect_to profile_path
			else
				redirect_to signup_path
			end
		end	
	end

	def show
		render :show
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
