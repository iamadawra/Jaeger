class VideosController < ApplicationController
  before_action :set_video, only: [:show, :upvote, :downvote]

  @@CDN_DNS = "http://d3bowxm1hun7br.cloudfront.net/"
  @@PER_PAGE = 12

  def index
    if params.has_key?(:search)
      @is_search = true
      param = params[:search]
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
    @video[:video_url] = "#@@CDN_DNS" + @video[:video_url]
    @video[:poster_url] = "#@@CDN_DNS" + @video[:poster_url]
  end

  def new
  end

  def search
    
  end

  def upvote
    if !@competition_id || @competition_id == "0"
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
    if !@competition_id || @competition_id == "0"
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