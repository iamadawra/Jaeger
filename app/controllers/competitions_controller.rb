require 'date'
# require 'active_support/core_ext/string'
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
    sql = "SELECT *, (rs.upvotes - rs.downvotes) AS votes FROM (
            SELECT videos.*,
                    sum(case when vote_flag = 1 then 1 else 0 end) AS upvotes,
                    sum(case when vote_flag = 0 then 1 else 0 end) AS downvotes
            FROM videos LEFT JOIN votes ON videos.id = votes.votable_id GROUP BY videos.id) AS rs 
          WHERE id IN (SELECT video_id FROM vc_relations WHERE competition_id = #{@competition.id} and is_approved = 1) ORDER BY votes DESC, upvotes DESC"
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
    str = competition_params['start_date(1i)'] + '-' + competition_params['start_date(2i)'] + '-' + competition_params['start_date(3i)']
    date = DateTime.parse(str)
    date = date + competition_params[:period].to_f.days
    formatted_date = date.strftime('%Y-%m-%d')
    @competition = Competition.new(competition_params.merge!(:end_date => formatted_date))

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
    session[:competition_id] = params[:cid]
    # puts params[:cid] + "----------------------"
    sql = "SELECT * FROM videos where id not in (select video_id from vc_relations where competition_id = #{params[:cid]})"
    @param = ""
    if params.has_key?(:search)
      param = params[:search]
      @param = param
      sql = sql + " AND (title LIKE '%#{param}%' || video_desc LIKE '%#{param}%' || tags LIKE '%#{param}%')"
    end
    @count = VcRelation.where(competition_id: params[:cid]).count('id')
    @videos = Video.paginate_by_sql(sql, page: params[:page], per_page: @@PER_PAGE)
    @competition = Competition.where(id: params[:cid]).first
    if @videos.count == 0 || !@competition
      redirect_to competitions_admin_path
    end
  end

  def add_videos
    @vc_relation = VcRelation.new(video_id: params[:vid], competition_id: params[:id])
    if @vc_relation.save
      count = VcRelation.where(competition_id: params[:id]).count('id')
      render :json => "{\"msg\": \"This video has been added to the competition successfully.\", \"size\": #{count}}"
    else
      render :json => "{\"error\": \"This video was already in the competition.\"}"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.where(id: params[:id]).first
      if !@competition 
        redirect_to action: "index"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competition_params
      params.require(:competition).permit(:title, :desc, :start_date, :period, :prize, :prize_num, :poster)
    end

    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "competitions/#{SecureRandom.uuid}/poster", success_action_status: '201', acl: 'public-read')
    end
end
