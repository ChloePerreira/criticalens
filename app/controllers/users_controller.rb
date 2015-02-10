class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @photos = @user.photos
    @photos1 = Photo.all
  end

end
