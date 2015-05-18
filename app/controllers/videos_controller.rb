class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @videos = Video.all
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
      params.require(:video).permit(:description, :title, :videourl, :image, :duration)
    end
end
