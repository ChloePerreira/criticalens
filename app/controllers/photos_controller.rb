class PhotosController < ApplicationController
  require 'httparty'

  def submit_photo
    flash[:notice] = "testing this stuff"
    str_hash = JSON.parse(params[:hash])
    render :nothing => true
  end

end
