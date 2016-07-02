class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :edit, :update, :destroy]
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  @@PER_PAGE = 9

  # GET /competitions
  # GET /competitions.json
  def index
    @competitions = Competition.all
  end

  def admin
    @competitions = Competition.all
  end

  # GET /competitions/1
  # GET /competitions/1.json
  def show
    sql = "SELECT * FROM videos where id in (select video_id FROM vc_relations where competition_id = #{@competition.id})"
    @videos = Video.paginate_by_sql(sql, page: params[:page], per_page: @@PER_PAGE)
  end

  # GET /competitions/new
  def new
    @competition = Competition.new
  end

  # GET /competitions/1/edit
  def edit
  end

  # POST /competitions
  # POST /competitions.json
  def create
    @competition = Competition.new(competition_params)

    respond_to do |format|
      if @competition.save
        format.html { redirect_to competitions_admin_path, notice: 'Competition was successfully created.' }
        format.json { render :show, status: :created, location: @competition }
      else
        format.html { render :new }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competitions/1
  # PATCH/PUT /competitions/1.json
  def update
    @competition_params_update = competition_params
    # puts @competition_params_update[:poster]
    if(@competition_params_update[:poster] == "")
      @competition_params_update.delete :poster
    end
    # puts @competition_params_update
    respond_to do |format|
      if @competition.update(@competition_params_update)
        format.html { redirect_to competitions_admin_path, notice: 'Competition was successfully updated.' }
        format.json { render :show, status: :ok, location: @competition }
      else
        format.html { render :edit }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitions/1
  # DELETE /competitions/1.json
  def destroy
    @competition.destroy
    respond_to do |format|
      format.html { redirect_to competitions_admin_path, notice: 'Competition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_videos
    sql = "SELECT * FROM videos"
    @videos = Video.paginate_by_sql(sql, page: params[:page], per_page: @@PER_PAGE)
    @competition = Competition.find(params[:cid])
    # @vc_relation = VcRelation.new
    if AddedVideosList.exists?(competition_id: params[:cid])
      @avl = AddedVideosList.where(competition_id: params[:cid])
      session[:list_id] = @avl[0][:id]
    else
      @avl = AddedVideosList.new(competition_id: params[:cid])
      @avl.save
      session[:list_id] = @avl[0][:id]
    end
    @added_video = AddedVideo.new
  end

  def add_videos
    @competition = VcRelation.new(params)
    respond_to do |format|
      if @competition.save
        format.html { redirect_to competitions_admin_path, notice: 'Competition was successfully created.' }
        format.json { render :show, status: :created, location: @competition }
      else
        format.html { render :new }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competition_params
      params.require(:competition).permit(:title, :desc, :start_date, :period, :prize, :prize_num, :poster)
    end

    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "competitions/#{SecureRandom.uuid}/poster", success_action_status: '201', acl: 'public-read')
    end
end
