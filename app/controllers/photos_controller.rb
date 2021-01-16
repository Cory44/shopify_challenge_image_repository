class PhotosController < ApplicationController
  require 'mini_magick'

  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    redirect_to root_path
    description = photo_params[:description]
    tags = photo_params[:tags].split(/\s*,\s*/)
    image = photo_params[:image]
    private_photo = photo_params[:private]

    path = photo_params[:image].tempfile.path
    ImageProcessing::MiniMagick.source(path).resize_to_fill(1000, 1000, { gravity: 'North' }).call(destination: path)

    photo = Photo.new(user: current_user, description: description, tags: tags, image: image, private: private_photo)
    photo.save()
  end

  def show
    @photo = Photo.find_by id: params[:id]
  end

  private
    def photo_params
      params.require(:photo).permit(:user, :description, :tags, :image, :private)
    end
end
