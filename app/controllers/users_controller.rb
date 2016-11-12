class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to Reservations_url, notice: "Yo signed up!"
		else
			render "new"
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(user_params)
			redirect_to user_url(@user)
		else
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :name, :phone)
	end
end
