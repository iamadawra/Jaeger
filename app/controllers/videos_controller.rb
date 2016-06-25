class VideosController < ApplicationController
  before_action :set_video, only: [:show, :upvote, :downvote]

  @@CDN_DNS = "http://d3bowxm1hun7br.cloudfront.net/"
  @@PER_PAGE = 9

  def index
    sql = "SELECT *, CONCAT('#@@CDN_DNS', poster_url) as c_poster_url FROM videos"
    @videos = Video.paginate_by_sql(sql, page: params[:page], per_page: @@PER_PAGE)
  end

  def show
    @video[:video_url] = "#@@CDN_DNS" + @video[:video_url]
    @video[:poster_url] = "#@@CDN_DNS" + @video[:poster_url]
  end

  def new
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