class ApiController < ApplicationController

  def test_api
    my_hash = {stuff: "blah", number: 23, another_number: 24, array: [1, 2, 3]}
    render json: my_hash
  end

  def aperture_tally
    render json: aperture_tally_data(params[:id])
  end

  def shutter_tally
    render json: shutter_tally_data(params[:id])
  end

  def iso_tally
    render json: iso_tally_data(params[:id])
  end

  def aperture_tally_all
    user_photos = User.find(params[:id]).photos
    too_wide = []
    too_narrow = []
    just_right = []
    user_photos.each do |photo|
      if photo.has_critiques?
        tally = aperture_tally_data(photo.id)
        too_wide.push(tally[:too_wide])
        too_narrow.push(tally[:too_narrow])
        just_right.push(tally[:just_right])
      end
    end
    too_wide_avg = array_avg(too_wide)
    too_narrow_avg = array_avg(too_narrow)
    just_right_avg = array_avg(just_right)
    render json: {too_wide: too_wide_avg, too_narrow: too_narrow_avg, just_right: just_right_avg}
  end

  def aperture_tally_data(photo_id)
    photo = Photo.find(photo_id)
    ap_used = photo.f_number.to_f
    h_ap = l_ap = r_ap = 0
    critiques = photo.get_critiques
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
  end
  
  def shutter_tally_all
    user_photos = User.find(params[:id]).photos
    too_fast = []
    too_slow = []
    just_right = []
    user_photos.each do |photo|
      if photo.has_critiques?
        tally = shutter_tally_data(photo.id)
        too_fast.push(tally[:too_fast])
        too_slow.push(tally[:too_slow])
        just_right.push(tally[:just_right])
      end
    end
    too_fast_avg = array_avg(too_fast)
    too_slow_avg = array_avg(too_slow)
    just_right_avg = array_avg(just_right)
    render json: {too_fast: too_fast_avg, too_slow: too_slow_avg, just_right: just_right_avg}
  end

  def shutter_tally_data(photo_id)
    photo = Photo.find(photo_id)
    sh_used = clean_shutter(photo.exposure_time)
    h_sh = l_sh = r_sh = 0
    critiques = photo.get_critiques
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
  end


  def iso_tally_all
    user_photos = User.find(params[:id]).photos
    too_high = []
    too_low = []
    just_right = []
    user_photos.each do |photo|
      if photo.has_critiques?
        tally = iso_tally_data(photo.id)
        too_high.push(tally[:too_high])
        too_low.push(tally[:too_low])
        just_right.push(tally[:just_right])
      end
    end
    too_high_avg = array_avg(too_high)
    too_low_avg = array_avg(too_low)
    just_right_avg = array_avg(just_right)
    render json: {too_high: too_high_avg, too_low: too_low_avg, just_right: just_right_avg}
  end

  def iso_tally_data(photo_id)
    photo = Photo.find(photo_id)
    iso_used = photo.iso.to_i
    h_iso = l_iso = r_iso = 0
    critiques = photo.get_critiques
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
  end 

  def critiques_received_and_given_tally
    hash = {
      user: User.find(params[:id]).name,
      given: given_received_tally("critiques_given".to_sym),
      received: given_received_tally("critiques_received".to_sym)
    }
    render json:hash
  end

  def given_received_tally(name_of_fxn) 
    d_array = []
    result = ApiController.send(name_of_fxn, params[:id])
    result.each do |critique|
      d_array.push(critique.created_at.strftime("%B %d, %Y"))
    end
    m_array = []
    30.downto(0) do |number|
      m_array.push((DateTime.now-(number.day)).strftime("%B %d, %Y"))
    end
    d_array = d_array + m_array
    counts = {}
    d_array.each do |d|
      counts[d]=0
    end
    d_array.each do |key, value|
      counts[key] += 1
    end
    m_array.each do |key, value|
      counts[key] -= 1
    end
    array = []
    counts.each do |key, value|
      array.push([key, value])
    end
    array.sort_by! do |element|
      DateTime.parse(element[0])
    end
    array
  end

  def self.critiques_received(user_id)
    photos = User.find(user_id).photos
    critiques = []
    photos.each do |photo|
      critiques.push (photo.get_critiques)
    end
    critiques = critiques.flatten
  end

  def self.critiques_given(user_id)
    User.find(user_id).critiques
  end

  def percent(val, sum)
     x =(val.to_f/sum.to_f)*100   
     x.to_i                         
  end

  def clean_shutter(value)      
    value = value[2..-1].to_i   
    value                       
  end                           

  def array_avg(array)            
    avg = array.sum/array.length  
    avg                           
  end                             


end
