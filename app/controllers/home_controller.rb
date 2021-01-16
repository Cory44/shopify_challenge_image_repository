class HomeController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @photos = Photo.where.not(user: current_user).shuffle
    else
      @photos = Photo.where(private: false).shuffle
    end
  end
end
