class HomeController < ApplicationController

  def index
  end

  def dashboard
    if session[:user_id]
      @photo_hash = Flickr.get_photos(current_user.fid)
      #@photo_hash.paginate(page: params[:page], per_page: 15)
    end
  end

end
