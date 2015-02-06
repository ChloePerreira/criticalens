class PhotosController < ApplicationController
  require 'httparty'

  def submit_photo
    # hash of photo details (id, urls) from params
    # keys are strings
    str_hash = JSON.parse(params[:hash])
    # now fetch the exif data
    exif_hash = Flickr.get_exif(str_hash['id'])
    @photo = Photo.create(
      user_id: session[:user_id],
      fid: str_hash['id'],
      small: str_hash['small'],
      small_320: str_hash['small_320'],
      medium_640: str_hash['medium_640'],
      large_square: str_hash['large_square'],
      medium_800: str_hash['medium_800'],  
      model: exif_hash[:Model],
      lens: exif_hash[:Lens],
      focal_length: exif_hash[:FocalLength] ,
      max_aperture_value: exif_hash[:MaxApertureValue], 
      exposure_time: exif_hash[:ExposureTime],
      iso: exif_hash[:ISO],
      white_balance: exif_hash[:WhiteBalance],
      f_number: exif_hash[:FNumber],
      flash: exif_hash[:Flash],
      ev: exif_hash[:ExposureCompensation]
    )     
    # make it so app doesn't search for a view bc using ajax
    render :nothing => true
  end

  def show
    @photo = Photo.find(params[:id])
  end
end
