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
			@user = User.where(email: params[:user][:email]) 
				#check to see if the user exists and the password matches
				if @user.length > 0 && @user[0].authenticated?(params[:user][:password])
					flash[:notice] = "Logged in"
					#store the session
					session[:user_id] = @user[0].id
					redirect_to root_path
				else
					flash[:notice] = "Incorrect Login Info"
					redirect_to root_path
				end
	end

end