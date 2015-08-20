class RelationshipsController < ApplicationController

	def create
		@club = Club.find(params[:followed_id])
    	current_user.follow(@club)
    	respond_to do |format|
		    format.html { redirect_to @club }
		    format.js
    	end
	end

	def destroy
		@club = Relationship.find(params[:id]).followed
    	current_user.unfollow(@club)
    	respond_to do |format|
		    format.html { redirect_to @club }
		    format.js
    	end
	end
end
