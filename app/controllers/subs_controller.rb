class SubsController < ApplicationController

	def index
		@subs = Sub.all
	end

	def create
		@sub = current_user.moderated_subs.build(params[:sub])
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
