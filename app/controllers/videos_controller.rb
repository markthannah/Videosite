class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :ntvids, :ic1vids, :ic2vids]
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @ic2testimonialvideos = Video.where("category = 'testimonial'", params[:category]).order(:order)
  end

  def show
  end

  def new
    @video = current_user.videos.build

  end

  def edit
  end

  def create
    @video = current_user.videos.build(video_params)
      if @video.save
        redirect_to @video, notice: 'Video was successfully created.'
      else
        render :new
      end
    end

  def update
      if @video.update(video_params)
        redirect_to @video, notice: 'Video was successfully updated.'
      else
        render :edit
      end
    end

  def destroy
    @video.destroy
    redirect_to videos_url
  end

  def ntvids
    @ntintrovideos = Video.where("product = 'netTrekker'", params[:product]).order(:order)
  end

  def ic1vids
    @ic1introvideos = Video.where("product = 'icurio 1.0'", params[:product]).order(:order)
  end

  def ic2vids
    @ic2introvideos = Video.where("product = 'icurio 2.0'", params[:product]).where("category = 'intro'", params[:category]).order(:order)
    @ic2testimonialvideos = Video.where("product = 'icurio 2.0'", params[:product]).where("category = 'testimonial'", params[:category]).order(:order)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    def correct_user
          @video = current_user.videos.find_by(id: params[:id])
          redirect_to videos_path, notice: "Sorry, you're not authorized to edit this video." if @video.nil?
        end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:description, :title, :videourl, :image, :duration, :order, :category, :product)
    end
end
