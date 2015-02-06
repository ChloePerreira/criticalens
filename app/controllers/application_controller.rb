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

  def setting_options(type)
    settings_array = []
    if type == "aperture"
      settings_array = [
        "0.7", "0.8", "0.9", "1.0", "1.1", "1.2", "1.4", "1.6",
        "1.8", "2", "2.2", "2.5", "2.8", "3.2", "3.5", "4",
        "4.5", "5", "5.6", "6.3", "7.1", "8", "9", "10", "11",
        "13", "14", "16", "18", "20", "22"
      ]
    elsif type == "iso"
      settings_array = [
        "100", "125", "160", "200", "250", "320",
        "400", "500", "640", "800", "1000", "1250",
        "1600", "2000", "2500", "3200", "4000", "5000",
        "6400", "8000", "10000", "12500"
    ]
    elsif type == "shutter speed"
      settings_array = [
        "1/15", "1/20", "1/25", "1/30", "1/40",
        "1/50", "1/60", "1/80", "1/100", "1/125",
        "1/160", "1/200", "1/250", "1/320", "1/400",
        "1/800", "1/1000", "1/1250", "1/1600", "1/2000",
        "1/2500", "1/3200", "1/4000", "1/5000", "1/8000"
      ]
    end
    return settings_array
  end

  def find_nearest (array, actual_val)
    nearest = -1
    bestDist = 1000.0
    d = 1000.0
    index = 0
    array.each_with_index |element, index|
      if array[i].to_f == actual_val 
        return i
      else
        d = (actual_val-array[i]).abs
        if d < bestDist
          nearest = array[i]
          index = i
          bestDist = d
        end
      end
    return index
  end


  helper_method 
    :current_user, 
    :has_critiqued?, 
    :get_critiques, 
    :setting_options, 
    :find_nearest
end
