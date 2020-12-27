class UserController < ApplicationController
  def show
    puts params
    @user=User.find_by id: params[:id]
  end
end
