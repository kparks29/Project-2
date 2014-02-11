class AuthsController < ApplicationController

	def new
		if current_user
			redirect_to edit_user_path
		else
			@user = User.new
			redirect_to users_path
		end
	end


	def create
		#pull the user from mongo
		@user = User.find_by(email: params[:user][:email])
		#check to see if the password matches
		if @user.authenticated?(params[:user][:password])
			#authenticated!!!
			#lets store the state that the user is logged in
			flash[:notice] = "Logged in"
			session[:user_id] = @user.id
			redirect_to users_path
		else
			flash[:notice] = "No Account can be found, try again  #{BCrypt::Engine.hash_secret(params[:user][:password], @user.salt)} = #{@user.hashed_password}"
			redirect_to users_path
		end
	end

end