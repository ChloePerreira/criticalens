class ApiController < ApplicationController

  def test_api
    my_hash = {stuff: "blah", number: 23, another_number: 24}
    render json: my_hash
  end

  def aperture_tally(photo)
    aperture = photo.f_number.to_f
    h_ap = l_ap = r_ap = 0
    ap_tally = {too_wide: l_ap, too_narrow: h_ap, just_right: r_ap}
    if
    elsif
    else
    end
  end


  #trash this
  def generate_tally(photo)
    aperture = photo.f_number.to_f
    shutter = photo.exposure_time.to_f
    # counts
    h_ap = l_ap = r_ap h_sh = l_sh = r_sh = h_iso = l_iso = r_iso = 0
    tally_hash = {}
    get_critiques(photo).each do |critique|
      #aperture
    tally_hash = {
      aperture: {too_wide: l_ap, too_narrow: h_ap, just_right: r_ap},
      shutter: {too_slow: h_sh, too_fast: l_sh, just_right: r_sh},
      iso: {too_high: h_iso, too_low: l_iso, just_right: r_iso}
    }
    return tally_hash
    end
  end

end
