class VideosController < ApplicationController
  before_action :set_video, only: [:show, :upvote, :downvote]
  @@PER_PAGE = 12

  def index
    if params.has_key?(:search)
      @is_search = true
      param = params[:search]
      @param = param
      sql = "SELECT * FROM videos WHERE is_approved = 1 AND (title LIKE '%#{param}%' || video_desc LIKE '%#{param}%' || tags LIKE '%#{param}%')"
      @videos = Video.paginate_by_sql(sql, page: params[:page], per_page: @@PER_PAGE)
    else
      sql = "SELECT * FROM videos WHERE is_approved = 1"
      @videos = Video.paginate_by_sql(sql, page: params[:page], per_page: @@PER_PAGE)
      if @videos.count == 0
        redirect_to root_path
      end
    end
  end

  def show
    @uploader = User.find(@video[:uploader_id])
    if params.has_key?(:cid) and VcRelation.where(video_id: @video.id, competition_id: params[:cid]).count != 0
      @competition = Competition.find(params[:cid])
      @cid = @competition.id
    end
  end

  def new
  end

  def search
    
  end

  def upvote
    if !@competition_id
      render :json => "{\"err\": \"The video is not in a competition.\"}"
    else
      scope = "competition_" + @competition_id;
      @video.upvote_from current_user, vote_scope: scope
      upvotes = @video.get_upvotes(vote_scope: scope).size
      downvotes = @video.get_downvotes(vote_scope: scope).size
      render :json => "{\"id\": #{@video.id}, \"upvotes\": #{upvotes}, \"downvotes\": #{downvotes}}"
    end
  end

  def downvote
    if !@competition_id
      render :json => "{\"err\": \"The video is not in a competition.\"}"
    else
      scope = "competition_" + @competition_id;
      @video.downvote_from current_user, vote_scope: scope
      upvotes = @video.get_upvotes(vote_scope: scope).size
      downvotes = @video.get_downvotes(vote_scope: scope).size
      render :json => "{\"id\": #{@video.id}, \"upvotes\": #{upvotes}, \"downvotes\": #{downvotes}}"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.where(id: params[:id]).first
      @competition_id = params[:competition_id]
      if !@video
        redirect_to action: "index"
      end
    end
end