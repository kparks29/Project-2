require 'rails/mongoid'
require 'bcrypt'

class UsersController < ApplicationController


	def index
		@user = User.new
	end

	def new
		flash[:notice] = "in user's new"
		@user = User.new
		redirect_to users_path
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if current_user.upload_image.url
			puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
			puts current_user.image
			puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
			puts params[:user][:image]
			

			params[:user][:image] = current_user.upload_image.url
			

			puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
			puts params[:user][:image]

		end
		if current_user.update(user_params)
			flash[:notice] = "Successfully updated account!"
			render action: 'edit'
		else
			flash[:notice] = "Couldn't update"
			render action: 'edit'
		end
		puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		puts current_user.image
		
	end

	def change_password
		if params[:user][:password] == params[:user][:password_confirmation] && params[:user][:password] != ""
			if current_user.update(user_params)
				flash[:notice] = "Successfully updated account!"
				render action: 'edit'
			else
				flash[:notice] = "Passwords Match, but couldn't update"
				render action: 'edit'
			end
		else
			flash[:notice] = "Passwords Don't Match!"
			render action: 'edit'
		end
	end

	def create
		@user = User.new(user_params)
			if @user.save
				flash[:notice] = "Created Account"
				session[:user_id] = @user.id
				redirect_to root_path
			else
				render action: 'index'
			end
	end

	def destroy
		@user = current_user

		if @user.destroy
			flash[:notice] = "Account Deleted"
			session[:user_id] = nil
			redirect_to users_path
		else
			render action: 'index'
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name,:last_name,:name,:email,:city,:location,:image,:password,:upload_image)
	end


end
