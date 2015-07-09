class CustomPagesController < ApplicationController
  before_action :set_custom_page, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @custom_pages = CustomPage.all
  end

  def show
  end

  def new
    @custom_page = current_user.custom_pages.build
    @videos = Video.all
    @testimonialvideos = Video.where("category = 'testimonial'", params[:category]).order(:order)
    @introvideos = Video.where("category = 'intro'", params[:category]).order(:order)
  end

  def edit
    @videos = Video.all
    @testimonialvideos = Video.where("category = 'testimonial'", params[:category]).order(:order)
    @introvideos = Video.where("category = 'intro'", params[:category]).order(:order)
  end

  def create
    @custom_page = current_user.custom_pages.build(custom_page_params)
    if @custom_page.save
      redirect_to @custom_page, notice: 'Custom page was successfully created.'
    else
      render :new
    end
    @custom_page.attributes = {'video_ids' => []}.merge(params[:custom_page] || {})
  end

  def update
    if @custom_page.update(custom_page_params)
      redirect_to @custom_page, notice: 'Custom page was successfully updated.'
    else
      render :edit
    end
    @custom_page.attributes = {'video_ids' => []}.merge(params[:custom_page] || {})
  end

  def destroy
    @custom_page.destroy
    redirect_to custom_pages_url, notice: 'Custom page was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_page
      @custom_page = CustomPage.find(params[:id])
    end

    def correct_user
      @custom_page = current_user.custom_pages.find_by(id: params[:id])
      redirect_to custom_pages_path, notice: "Sorry, this isn't your's to edit." if @custom_page.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_page_params
      params.require(:custom_page).permit(:greeting, :message, :recipient)
    end

end
