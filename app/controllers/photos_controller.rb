class PhotosController < ApplicationController
  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    photo = Photo.create!(photo_params)
    redirect_to root_path
  end

  private
    def user_params
      params.require(:photo).permit(:description, :tags, :image)
    end
end
