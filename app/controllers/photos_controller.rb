class PhotosController < ApplicationController
  require 'httparty'

  def submit_photo
    str_hash = JSON.parse(params[:hash])
    exif_hash = Flickr.get_exif(str_hash['id'])
    puts exif_hash
    render :nothing => true
  end

end
