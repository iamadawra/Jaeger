class VideosController < ApplicationController
  before_action :set_video, only: [:show, :upvote, :downvote]

  @@CDN_DNS = "http://d3bowxm1hun7br.cloudfront.net/"
  @@PER_PAGE = 9

  def index
    if params.has_key?(:search)
      @is_search = true
      param = params[:search]
      @param = param
      sql = "SELECT *, CONCAT('#@@CDN_DNS', poster_url) as c_poster_url FROM videos WHERE title LIKE '%#{param}%' || video_desc LIKE '%#{param}%' || tags LIKE '%#{param}%'"
      @videos = Video.paginate_by_sql(sql, page: params[:page], per_page: @@PER_PAGE)
    else
      sql = "SELECT *, CONCAT('#@@CDN_DNS', poster_url) as c_poster_url FROM videos"
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
    @video.upvote_from current_user
    upvotes = @video.get_upvotes.size
    downvotes = @video.get_downvotes.size
    render :json => "{\"id\": #{@video.id}, \"upvotes\": #{upvotes}, \"downvotes\": #{downvotes}}"
  end

  def downvote
    @video.downvote_from current_user
    upvotes = @video.get_upvotes.size
    downvotes = @video.get_downvotes.size
    render :json => "{\"id\": #{@video.id}, \"upvotes\": #{upvotes}, \"downvotes\": #{downvotes}}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.where(id: params[:id]).first
      if !@video  
        redirect_to action: "index"
      end
    end
end