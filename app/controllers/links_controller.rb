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
		@already_rendered = []
		@link = Link.find(params[:id])
		@comments = @link.comments
	end

	def destroy
	end

	def upvote
		u = current_user
		link = Link.find(params[:link_id])
		if u.links_voted_on.include?(link)
			flash[:errors] ||= []
			flash[:errors] << "Can't vote on the same link twice!"
			redirect_to link_url(link)
			return
		end
		vote = u.user_votes.build(:link_id => params[:link_id])
		u.save!
		link.score += 1
		link.save!
		redirect_to link_url(link)
	end

	def downvote
		u = current_user
		link = Link.find(params[:link_id])
		if u.links_voted_on.include?(link)
			flash[:errors] ||= []
			flash[:errors] << "Can't vote on the same link twice!"
			redirect_to link_url(link)
			return
		end
		vote = u.user_votes.build(:link_id => params[:link_id])
		u.save!
		link.score -= 1
		link.save!
		redirect_to link_url(link)
	end

end
