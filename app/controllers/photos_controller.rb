class PhotosController < ApplicationController
  require 'httparty'

  def submit_photo
    str_hash = JSON.parse(params[:hash])
    x = Flickr.get_exif('15387008027')
    if x==false
      flash[:notice] = "testing this stuff"
    end
    render :nothing => true
  end

end
