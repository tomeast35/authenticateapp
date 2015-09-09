class SessionsController < ApplicationController

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

end
