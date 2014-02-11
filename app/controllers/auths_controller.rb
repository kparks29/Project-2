class AuthsController < ApplicationController

	def new
		if current_user
			redirect_to edit_user_path
		else
			@user = User.new
			redirect_to root_path
		end
	end


	def create
		#pull the user from mongo

		#need to check to see if user exists first to prevent error
		# if !!User.find_by(email: params[:user][:email]) == true
			@user = User.find_by(email: params[:user][:email])
			#check to see if the password matches
			if @user.authenticated?(params[:user][:password])
				#authenticated!!!
				#lets store the state that the user is logged in
				flash[:notice] = "Logged in + #{@user.first_name}"
				#send to seesions controller
				redirect_to root_path
			else
				flash[:notice] = "Cannot be authenticated + #{BCrypt::Engine.hash_secret(params[:user][:password], @user.salt)} + #{@user.hashed_password}"
				redirect_to root_path
			end
		# else
		# 	flash[:notice] = "No account"
		# end
	end

end