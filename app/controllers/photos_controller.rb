class PhotosController < ApplicationController
  require 'httparty'

  def submit_photo
    str_hash = JSON.parse(params[:hash])
    render :nothing => true
  end

end
