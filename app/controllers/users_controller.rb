class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if params[:show_diff_data] == "all"
      @photos = @user.photos
    elsif params[:show_diff_data] == "no critiques"
      @photos = get_photos_wo_critiques(params[:id])
    else
      @photos = []
    end
  end

end
