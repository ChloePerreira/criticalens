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
    critiques_authored = Critique.where(author: session[:user_id])
    if critiques_authored.where(fid: fid).size > 0
      return true
    else
      return false
    end
  end

  def has_critiques? (fid)
    #pass in photo as arg
    #photo.has_critiques? in here instead of logic
    #stopgap measure
    #if Critique.where(fid: fid).length > 0
    #  return true
    #else
    #  return false
    #end
    photo = Photo.where(fid: fid).first
    photo.has_critiques?
  end

  def get_critique (fid) # returns current user's critique of a photo
    Critique.where(author: session[:user_id], fid: fid).first  
  end

  def get_critiques (photo) # returns all critiques for a photo
    Critique.where(fid: photo.fid)
  end

  def get_avg_aperture_sugg (photo)
    apertures = array_of_critique_vals(photo, "sugg_ap")
    apertures = apertures.map(&:to_f)
    avg = apertures.sum/apertures.length
    avg = setting_options("aperture")[find_nearest(setting_options("aperture"), avg)]
    avg
  end 

  def get_avg_shutter_sugg (photo)
    shutters = array_of_critique_vals(photo, "sugg_sh")
    shutters.each_with_index do |val, index|
      shutters[index] = clean_shutter(val).to_f
    end
    avg_denom = shutters.sum/shutters.length
    clean_sh_array = clean_shutter_array(setting_options("shutter speed"))
    avg_denom = clean_sh_array[find_nearest(clean_sh_array, avg_denom)]
    avg = "1/"+avg_denom.to_s
    avg
  end

  def get_avg_iso_sugg (photo)
    isos = array_of_critique_vals(photo, "sugg_iso")
    isos = isos.map(&:to_i)
    avg = isos.sum/isos.length
    avg = setting_options("iso")[find_nearest(setting_options("iso"), avg)]
    avg
  end

  def array_of_critique_vals (photo, name_of_val)
    critiques = get_critiques(photo)
    suggestions = []
    name_of_val = name_of_val.to_sym
    critiques.each do |critique|
      suggestions.push(critique.send(name_of_val))
    end
    suggestions
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

  def clean_shutter_array (array)
    new = []
    array.each do |val|
      new.push(clean_shutter(val))
    end
    new
  end

  def clean_shutter(value)
    value = value[2..-1].to_i
    value
  end

  def find_nearest (array, actual_val) #WILL NOT WORK WITH SHUTTER SPEED, returns array index
    nearest = -1
    bestDist = 1000.0
    d = 1000.0
    index = 0
    array.each_with_index do |element, i|
      if element.to_f == actual_val 
        puts i
        return i
      else
        d = (actual_val-element.to_f).abs
        if d < bestDist
          nearest = element
          index = i
          puts i
          bestDist = d
        end
      end
    end
    return index
  end

  def percent(val, sum)
    x =(val.to_f/sum.to_f)*100
    x.to_i
  end


  def get_photos_wo_critiques(user_id) 
    photos = []
    user_photos = User.find(user_id).photos
    user_photos.each do |photo|
      if get_critiques(photo).size<1
        photos.push(photo)
      end
    end
    photos
  end

  def array_avg(array)
    avg = array.sum/array.length
    avg
  end

  helper_method :current_user, :has_critiqued?, :get_critiques, :setting_options, :find_nearest, :clean_shutter, :percent, :get_photos_wo_critiques, :get_critique, :array_of_critique_vals, :get_avg_aperture_sugg, :get_avg_iso_sugg, :get_avg_shutter_sugg, :has_critiques?, :array_avg 
end
