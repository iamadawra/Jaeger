class UploadVideosController < ApplicationController
  before_action :set_upload_video, only: [:show, :edit, :update, :destroy]
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]
  before_action :check_login

  @@PER_PAGE = 10

  # GET /upload_videos
  # GET /upload_videos.json
  def index
    @upload_videos = Video.where(:uploader_id => current_user.id).order(created_at: :desc).paginate(page: params[:page], per_page: @@PER_PAGE)
  end

  # GET /upload_videos/1
  # GET /upload_videos/1.json
  def show
  end

  # GET /upload_videos/new
  def new
    @upload_video = Video.new
  end

  # GET /upload_videos/1/edit
  def edit
  end

  # POST /upload_videos
  # POST /upload_videos.json
  def create
    uvp = upload_video_params
    uvp[:uploader_id] = current_user.id
    @upload_video = Video.new(uvp)

    respond_to do |format|
      if @upload_video.save
        format.html { redirect_to :controller => 'upload_videos', notice: 'Upload video was successfully created.' }
        format.json { render :show, status: :created, location: @upload_video }
      else
        format.html { render :new }
        format.json { render json: @upload_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /upload_videos/1
  # PATCH/PUT /upload_videos/1.json
  def update
    respond_to do |format|
      if @upload_video.update(upload_video_params)
        format.html { redirect_to :controller => 'upload_videos', notice: 'Upload video was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload_video }
      else
        format.html { render :edit }
        format.json { render json: @upload_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upload_videos/1
  # DELETE /upload_videos/1.json
  def destroy
    @upload_video.destroy
    respond_to do |format|
      format.html { redirect_to upload_videos_url, notice: 'Upload video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload_video
      @upload_video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_video_params
      params.require(:video).permit(:title, :video_url, :poster_url, :tags, :video_desc, :is_approved)
    end

    def set_s3_direct_post
      uuid = "#{SecureRandom.uuid}";
      puts ENV['S3_BUCKET']
      puts ENV['AWS_ACCESS_KEY_ID']
      puts ENV['AWS_SECRET_ACCESS_KEY'];
      puts "aaaaaa";
      @s3_direct_post = S3_BUCKET.presigned_post(key: "videos/" + uuid + "/video", success_action_status: '201', acl: 'public-read')
      @s3_direct_post_poster = S3_BUCKET.presigned_post(key: "videos/" + uuid + "/poster", success_action_status: '201', acl: 'public-read')
    end

    def check_login
      if !current_user
        redirect_to login_path
      end
    end
end
