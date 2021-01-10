class HomeController < ApplicationController
  def index
    @photos = Photo.all.to_a
    if user_signed_in?
      @user = current_user
    end
  end
end
