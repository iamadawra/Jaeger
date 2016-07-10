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

  def vc_relations
    @approved = 0
    @str = "pending"


    if (params.has_key?(:approved))
      @approved = params[:approved]
      if (params[:approved] == "1")
        @str = "approved"
      elsif params[:approved] == "-1"
        @str = "denied"
      end
    end

  	if params.has_key?(:cid)
  		@competition = Competition.where(:id => params[:cid]).first
  	else
  		@competition = Competition.all.order('start_date DESC').first
  	end
  	@competitions = Competition.all
  	@vc_relations = VcRelation.where(:competition_id => @competition.id, :is_approved => @approved)
  end

  def vc_approve
    VcRelation.where(:id => params[:id]).first.update_attribute(:is_approved, params[:approved])
    redirect_to admin_vc_relations_path(:approved => params[:ori])
  end
end
