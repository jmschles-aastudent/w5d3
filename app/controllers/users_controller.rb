class UsersController < ApplicationController

	def create
		@user = User.new(params[:user])
		if @user.save
			login(@user)
			redirect_to user_url(@user)
		else
			render :new
		end
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		@moderated_subs = @user.moderated_subs
	end

end
