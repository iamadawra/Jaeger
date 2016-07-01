class VideoCartsController < ApplicationController
  def show
  	if params.has_key?(:cid)
  		if AddedVideosList.exists?(competition_id: params[:cid])
	      @avl = AddedVideosList.where(competition_id: params[:cid])
	    else
	      @avl = AddedVideosList.new(competition_id: params[:cid])
	      @avl.save
	    end
	    session[:list_id] = @avl[0][:id]
  	end

  	@added_videos = current_list.added_videos
  	@competition = Competition.find(current_list[:competition_id])
  end
end
