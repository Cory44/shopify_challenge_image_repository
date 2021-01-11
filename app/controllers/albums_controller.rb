class AlbumsController < ApplicationController

  def new
    @album = Album.new
  end

  def create
    name = album_params[:name]
    tags = album_params[:tags].split(/\s*,\s*/)
    private_album = album_params[:private]
    album = Album.new(user: current_user, name: name, tags: tags, private: private_album)
    album.save()

    album_params[:images].each do |image|
      photo_description = ""
      photo_tags = tags
      photo_image = image
      private_photo = album_params[:private]

      path = image.tempfile.path
      ImageProcessing::MiniMagick.source(path).resize_to_fill(1000, 1000, { gravity: 'North' }).call(destination: path)

      photo = Photo.new(user: current_user, description: photo_description, tags: photo_tags, image: photo_image, private: private_photo)
      photo.save()
      album.photos << photo
    end
    redirect_to root_path
  end

  private
    def album_params
      params.require(:album).permit(:user, :name, :tags, :private, images: [])
    end

end
