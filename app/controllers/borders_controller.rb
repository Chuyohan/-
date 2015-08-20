class BordersController < ApplicationController
  before_action :set_border, only: [:show, :edit, :update, :destroy]

  # GET /borders
  # GET /borders.json
  def index
    @borders = Border.all.paginate(page: params[:page]).per_page(10)
  end

  # GET /borders/1
  # GET /borders/1.json
  def show
    #클리시 조회수를 위한 코드
    @border = Border.where("id = ?", params[:id]).first
    @border.update_column('count', @border.count+1) unless @border.count.nil?
  end

  # GET /borders/new
  def new
    @border = Border.new
  end

  # GET /borders/1/edit
  def edit
  end

  # POST /borders
  # POST /borders.json
  def create
    @border = current_user.borders.build(border_params)
    @border.count = 0

    if @border.save
      flash[:success] = "세종대 동아리 소개 홈페이지에 오신걸 환영합니다!"
      redirect_to borders_url
    else
      render :new
      render json: @border.errors
    end
  end

  # PATCH/PUT /borders/1
  # PATCH/PUT /borders/1.json
  def update
    
    if @border.update(border_params)
      flash[:success] = "세종대 동아리 소개 홈페이지에 오신걸 환영합니다!"
      redirect_to borders_url
    else
      render :edit
      render json: @border.errors
    end
    
  end

  # DELETE /borders/1
  # DELETE /borders/1.json
  def destroy
    @border.destroy
    flash[:success] = "세종대 동아리 소개 홈페이지에 오신걸 환영합니다!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_border
      @border = Border.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def border_params
      params.require(:border).permit(:content, :title)  
    end
end
