class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  require './lib/flickr'
  require 'active_support/core_ext'
  require 'date'

  helper :all

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def has_critiqued? (fid)
    if @current_user
      critiques_authored = current_user.critiques #Critique.where(author: session[:user_id])
      if critiques_authored.where(fid: fid).size > 0
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def get_critique (fid) # returns current user's critique of a photo
    current_user.critiques.where(fid: fid).first #Critique.where(author: session[:user_id], fid: fid).first  
  end

  def get_photos_wo_critiques(user_id) 
    photos = []
    user_photos = User.find(user_id).photos
    user_photos.each do |photo|
      if photo.get_critiques.size<1
        photos.push(photo)
      end
    end
    photos
  end


  helper_method :current_user, :has_critiqued?, :get_critique, :get_photos_wo_critiques
end
