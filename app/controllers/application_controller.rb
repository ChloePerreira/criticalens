class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  require './lib/flickr'

  helper :all

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def has_critiqued? (fid)
    critiques_authored = Critique.where(author: session[:user_id])
    if critiques_authored.where(fid: fid).size > 0
      return true
    else
      return false
    end
  end

  def get_critiques (photo)
    Critique.where(fid: photo.fid)
  end

  helper_method :current_user, :has_critiqued?, :get_critiques
end
