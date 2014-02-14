class BoutsController < ApplicationController

	def index
		@bout_requests = BoutRequest.All
	end

	def new
		@bout_request = BoutRequest.new
	end

	def create
		@bout_request = BoutRequest.new
		if @bout_request.save(bout_request_params)
			flash[:notice] = "Request Submitted"
			redirect_to @bout_request
		else
			flash[:error] = "Bout Request Unable to be Submitted"
			render 'new'
		end
	end

	def show
		@bout_request = BoutRequest.find(params[:id])
	end

	def show_all_requests_for_user
		@bout_requests = current_user.bout_requests
		render 'index'
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
