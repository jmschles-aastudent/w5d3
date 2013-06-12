class LinksController < ApplicationController

	def create
		@link = Link.new(params[:link])
		@link.author_id = current_user.id
		if @link.save
			redirect_to sub_url(@link.sub)
		else
			render :json => "Bummer, man!"
		end
	end

	def destroy
	end

end
