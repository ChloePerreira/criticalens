class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if params[:show_diff_data] == "all"
      @photos = @user.photos.paginate(page: params[:page], per_page: 15)
    elsif params[:show_diff_data] == "no critiques"
      @photos = get_photos_wo_critiques(params[:id]).paginate(page: params[:page], per_page: 15)
    else
      @photos = []
    end
  end
  
  def submit_email
    #check that id actually matches current user
    if params[:id].to_i == current_user.id
      user = User.find(params[:id])
      user.email = params[:email]
      user.save
    end
    render :nothing => true
  end

  def delete_email
    if params[:id].to_i == current_user.id
      user = User.find(params[:id])
      user.email = nil
      user.save
    end
    render :nothing => true
  end

end
