class VideoCartsController < ApplicationController
  def show
  	cid = 1
  	if(params[:cid])
  		cid = params[:cid]
  		session[:competition_id] = cid
  	elsif(session[:competition_id])
  		cid = session[:competition_id]
  	end
    @count = VcRelation.where(competition_id: cid).count('id')
  	@added_videos = Video.where(id: VcRelation.where(competition_id: cid).select(:video_id)) 
  	@competition = Competition.find(cid)
  end

  def destroy
  	VcRelation.where(video_id: params[:id], competition_id: session[:competition_id]).destroy_all
    @added_videos = Video.where(id: VcRelation.where(competition_id: session[:competition_id]).select(:video_id)) 
  end
end
