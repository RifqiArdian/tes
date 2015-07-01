class SessionsController < ApplicationController
	before_filter :authenticate_user, :only => [:destroy]
	before_filter :save_login_state, :except => [:destroy]

	def index
		# login
	end

	def create
		authorized_user = User.authenticate(params[:username],params[:password])
		flash = {}
		if authorized_user
	    session[:userid] = authorized_user.id
			redirect_to distributors_path, notice: "Wow Welcome back, you logged in as #{authorized_user.username}"

		else
			@flashmessage = {}
			@flashmessage[:alert] = "Invalid Username or Password"
			render "index"
		end
	end

	def destroy
		session.destroy
		flash = {}
		redirect_to sessions_path, alert: "Thank you"
	end
end
