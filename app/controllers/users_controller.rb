require 'rails/mongoid'
require 'bcrypt'

class UsersController < ApplicationController


	def index
		@user = User.new
	end

	def new
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
		if current_user.update(user_params)
			render action: 'edit'
		else
			render action: 'edit'
		end
	end

	def create
		@user = User.new(user_params)
			if @user.save
				flash[:notice] = "Created Account"
				session[:user_id] = @user.id
				redirect_to users_path
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
		params.require(:user).permit(:first_name,:last_name,:name,:salt,:hashed_password,:email,:city,:state,:zip_code,:image)
	end


end
