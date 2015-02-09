class ApiController < ApplicationController

  def test_api
    my_hash = {stuff: "blah", number: 23, another_number: 24}
    render json: my_hash
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
        l_ap += 1
      end
    end
    sh_tally = {too_fast: l_sh, too_slow: h_sh, just_right: r_sh}
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
    iso_tally = {too_high: l_iso, too_low: h_iso, just_right: r_iso}
    render json: iso_tally
  end 


end
