class UsersController < ApplicationController

	def index
		redirect_to tops_path
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
		redirect_to users_path
		else
			render 'new'
		end
	end

private
	def user_params
		params[:user].permit(:email, :password, :password_confirmation)
	end
end
