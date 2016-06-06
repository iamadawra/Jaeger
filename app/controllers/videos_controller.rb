class VideosController < ApplicationController
  @@CDN_DNS = "http://d3bowxm1hun7br.cloudfront.net/"
  @@PER_PAGE = 6

  def index
    sql = "SELECT *, CONCAT('#@@CDN_DNS', poster_url) as c_poster_url FROM videos"
    @videos = Video.paginate_by_sql(sql, page: params[:page], per_page: @@PER_PAGE)
  end

  def show
    if params[:id]
      id = params[:id]
    else
      redirect_to action: "index"
    end
    
    @video = Video.find_by_id(id)
    if !@video  
      redirect_to action: "index"
    else
      @video[:video_url] = "#@@CDN_DNS" + @video[:video_url]
      @video[:poster_url] = "#@@CDN_DNS" + @video[:poster_url]
    end
  end

  def new
  end
end
