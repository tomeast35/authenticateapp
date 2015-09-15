class SessionsController < ApplicationController

	def index
		redirect_to tops_path
	end

	def new

	end

	def create

		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			redirect_to root_path
		else
			flash.now[:error] = '組み合わせが違うよ'
			render 'new'
		end
	end

	def destroy
	session[:user_id] = nil
	redirect_to root_path		
	end
	
end
