class ApiController < ApplicationController

  def test_api
    my_hash = {stuff: "blah", number: 23, another_number: 24}
    render json: my_hash
  end

  def critiqued_photos
    # get the users photos size 
    # get the users photos have been critiqued and that size
    # spit out the numbers in a json 
    
  end

  def aperture_tally
    photo = Photo.find(params[:id])
    ap_used = photo.f_number.to_f
    h_ap = l_ap = r_ap = 0
    critiques = get_critiques(photo)
    critiques.each do |c|
      sugg_ap = c.sugg_ap.to_f
      if sugg_ap == ap_used
        r_ap += 1
      elsif sugg_ap > ap_used
        h_ap += 1
      else
        l_ap += 1
      end
    end
    sum = h_ap + l_ap + r_ap
    ap_tally = {too_wide: percent(h_ap,sum), too_narrow: percent(l_ap,sum), just_right: percent(r_ap,sum)}
    render json: ap_tally
  end

  
  def shutter_tally
    photo = Photo.find(params[:id])
    sh_used = clean_shutter(photo.exposure_time)
    h_sh = l_sh = r_sh = 0
    critiques = get_critiques(photo)
    critiques.each do |c|
      sugg_sh = clean_shutter(c.sugg_sh)
      if sugg_sh == sh_used
        r_sh += 1
      elsif sugg_sh > sh_used
        h_sh += 1
      else
        l_sh += 1
      end
    end
    sum = l_sh + h_sh + r_sh
    sh_tally = {too_fast: percent(l_sh, sum), too_slow: percent(h_sh, sum), just_right: percent(r_sh, sum)}
    render json: sh_tally
  end


  def iso_tally
    photo = Photo.find(params[:id])
    iso_used = photo.iso.to_i
    h_iso = l_iso = r_iso = 0
    critiques = get_critiques(photo)
    critiques.each do |c|
      sugg_iso = c.sugg_iso.to_i
      if sugg_iso == iso_used
        r_iso += 1
      elsif sugg_iso > iso_used
        h_iso += 1
      else
        l_iso += 1
      end
    end
    sum = l_iso + h_iso + r_iso
    iso_tally = {too_high: percent(l_iso, sum), too_low: percent(h_iso, sum), just_right: percent(r_iso, sum)}
    render json: iso_tally
  end 

  def critiques_received(user_id)
    photos = User.find(user_id).photos
    critiques = []
    photos.each do |photo|
      critiques.push (get_critiques(photo))
    end
    critiques = critiques.flatten
  end

  def last_month(stuff)
    now = DateTime.now.to_i
    then = now-30.days.to_i
    range = then..now
    matches = []
    stuff.each do |thing|
      date = thing.created_at.to_i
      if range.include?(date)
        matches.push(thing)
      end
    end
    matches
  end

end
