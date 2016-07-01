class AddedVideosController < ApplicationController
  def create
  	@video_list = current_list
    @added_video = @video_list.added_videos.new(added_video_params)
    @video_list.save
    session[:list_id] = @video_list.id
  end

  def update
  	@video_list = current_list
    @added_video = @video_list.added_videos.find(params[:id])
    @added_video.update_attributes(added_video_params)
    @added_videos = @video_list.added_videos
  end

  def destroy
  	@video_list = current_list
    @added_video = @video_list.added_videos.find(params[:id])
    @added_video.destroy
    @added_videos = @video_list.added_videos
    @video_list.save
  end

  private
  def added_video_params
    params.require(:added_video).permit(:video_id, :added_videos_list_id)
  end
end
