class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @photos = @user.photos
  end

end
