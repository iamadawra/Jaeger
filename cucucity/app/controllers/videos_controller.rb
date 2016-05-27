class VideosController < ApplicationController
  @@CDN_DNS = "http://d3bowxm1hun7br.cloudfront.net/"

  def index
   @videos = Video.find_by_sql("SELECT *, CONCAT('#@@CDN_DNS', poster_url) as poster_url FROM videos")
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
