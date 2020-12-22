class HomeController < ApplicationController
  def index
    puts current_user.username
    if user_signed_in?
      @user = current_user
    end
  end
end
