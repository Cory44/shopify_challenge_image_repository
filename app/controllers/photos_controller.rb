class PhotosController < ApplicationController
  require 'mini_magick'

  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    description = photo_params[:description]
    tags = photo_params[:tags].split(/\s*,\s*/)
    image = photo_params[:image]

    path = photo_params[:image].tempfile.path
    ImageProcessing::MiniMagick.source(path).resize_to_fill(1000, 1000, { gravity: 'North' }).call(destination: path)

    photo = Photo.new(user: current_user, description: description, tags: tags, image: image)
    photo.save()
    redirect_to root_path
  end

  private
    def photo_params
      params.require(:photo).permit(:user, :description, :tags, :image)
    end
end
