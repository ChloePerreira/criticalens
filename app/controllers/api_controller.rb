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
    #
  end

  def aperture_tally_data(photo_id)
    photo = Photo.find(photo_id)
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
  end

  
  def shutter_tally_data(photo_id)
    photo = Photo.find(photo_id)
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
  end


  def iso_tally_data(photo_id)
    photo = Photo.find(photo_id)
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
      critiques.push (get_critiques(photo))
    end
    critiques = critiques.flatten
  end

  def self.get_critiques(photo)
    Critique.where(fid: photo.fid)
  end

  def self.critiques_given(user_id)
    Critique.where(author: user_id)
  end

  #def last_month_date_matches(stuff) #pass critiques
  #  now = DateTime.now
  #  month_ago = (now-(31.days)).to_i
  #  now = now.to_i
  #  range = month_ago..now
  #  matches = []
  #  stuff.each do |thing|
   #   date = thing.created_at.to_i
  #  if range.include?(date)
   #     matches.push(thing.created_at.to_i) # push just the date maybe, then counting is easier
    #  end
   # end
   # matches
 # end

  #def gen_month
   # now = DateTime.now
    #array = [now.to_i]
    #x = 1
    #while x < 31
    #  array.push((now-x.days).to_i)
     # x += 1
    #end
    #array
 # end

  #def readable_date (int_date)
   #     readable = Time.at(int_date).to_datetime.strftime("%B %d, %Y")
   # readable
  #end

  #def gen_readable_date_array(array)
   # readable_dates = []
   # array.each do |element|
    #  readable_dates.push(readable_date(element))
    #end
   # readable_dates
 # end

end
