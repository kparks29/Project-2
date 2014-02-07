require 'rails/mongoid'

class UserController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "Created Account"
			redirect_to users_path
		else
			render action: 'index'
		end
	end

	def destroy
		@user = User.find(params[:id])

		if @user.destroy
			flash[:notice] = "Account Deleted"
			redirect_to users_path
		else
			render action: 'index'
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name,:last_name,:username,:salt,:hashed_password)
	end


end
