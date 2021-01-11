class UsersController < ApplicationController
  def show
    puts params
    @user=User.find_by id: params[:id]
    @current_user = current_user
  end
end
