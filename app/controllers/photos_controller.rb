class PhotosController < ApplicationController
  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    # photo = Photo.create!(photo_params)
    description = photo_params[:description]
    tags = photo_params[:tags].split(/\s*,\s*/)
    image = photo_params[:image]
    photo = Photo.create!(user: current_user, description: description, tags: tags, image: image)
    redirect_to root_path
  end

  private
    def photo_params
      params.require(:photo).permit(:user, :description, :tags, :image)
    end
end
