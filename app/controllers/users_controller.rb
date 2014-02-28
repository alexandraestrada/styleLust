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
end
