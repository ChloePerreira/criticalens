class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if params[:show_diff_data]
      @photos = Photo.all
    else
      @photos = @user.photos[0..2]
    end
  end


end
