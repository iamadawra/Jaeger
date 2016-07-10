class AdminController < ApplicationController
  @@PER_PAGE = 12

  def videos
  	@approved = 0
  	@str = "pending"
  	if params.has_key?(:approved)
  		@approved = params[:approved]
  	end

  	if @approved == "-1"
  		@str = "denied"
  	elsif @approved == "1"
  		@str = "approved"
  	end
  	
  	@videos_not_approved = Video.where(is_approved: @approved).paginate(page: params[:page], per_page: @@PER_PAGE)
  end

  def review
  	@video = Video.where(:id => params[:id]).first
  	@denied_size = Video.where(:uploader_id => @video.user.id, :is_approved => -1).count
  end

  def approve
  	Video.where(:id => params[:vid]).first.update_attribute(:is_approved, params[:review_action])
  	redirect_to admin_videos_path(:approved => params[:review_action])
  end
end
