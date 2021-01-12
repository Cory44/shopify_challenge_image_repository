class HomeController < ApplicationController
  def index
    @photos = Photo.where(private: false)
    if user_signed_in?
      @user = current_user
    end
  end
end
