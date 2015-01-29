class PhotosController < ApplicationController
  require 'httparty'

  def submit_photo
    puts "blah" # will this show up in my server? YES 
    render :nothing => true
  end

end
