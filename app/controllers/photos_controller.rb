class PhotosController < ApplicationController
  require 'httparty'

  def submit_photo
    puts "word" # will this show up in my server? YES 
    puts JSON.parse(params[:hash])['id']
    puts render :nothing => true
  end

end
