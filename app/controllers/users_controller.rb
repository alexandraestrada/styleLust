class UsersController < ApplicationController
	def index
		@user = User.new		
	end

	def new
		@user=User.new
		redirect_to root_path

	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(email: params[:email])
		if @user.save

			flash[:notice] = "account created"
			redirect_to root_path
		else
			flash[:error] = "account could not be created"
		end
	end
end
