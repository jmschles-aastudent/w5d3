class SubsController < ApplicationController

	def create
		@sub = Sub.new(params[:sub])
		@sub.moderator_id = current_user.id
		if @sub.save
			redirect_to sub_url(@sub)
		else
			render :new
		end
	end

	def new
		@sub = Sub.new
	end

	def show
		@sub = Sub.find(params[:id])
	end

end
