class LinksController < ApplicationController

	def create
		# @link = Link.new(params[:link])
		# @link.author_id = current_user.id
		@link = current_user.authored_links.build(params[:link])
		if @link.save
			redirect_to link_url(@link)
		else
			render :new
		end
	end

	def new
		@link = Link.new
	end

	def update
		@link = Link.find(params[:id])
		if @link.update_attributes(params[:link])
			redirect_to link_url(@link)
		else
			render :edit
		end
	end

	def edit
		@link = Link.find(params[:id])
	end

	def show
		@link = Link.find(params[:id])
	end

	def destroy
	end

end
