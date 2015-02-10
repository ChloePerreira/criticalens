class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if params[:show_diff_data]
      @photos = Photo.all
    else
      @photos = @user.photos[0..2]
    end
  end

  def all_test
    @photos = Photo.all
    respond_to do |format|
      format.js
    end
  end


end
