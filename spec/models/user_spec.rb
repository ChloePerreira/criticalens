require 'rails_helper'

describe ".validates" do
  it "must have an fid" do
    expect(User.new(fid: nil)).to_not be_valid
  end

  it "must have an name" do
    expect(User.new(name: nil)).to_not be_valid
  end
end

describe ".photos" do
  photo = Photo.create(
    user_id: 1,
    medium_640: 1,
    max_aperture_value: 1,
    lens: 1,
    model: 1,
    exposure_time: 1,
    iso: 1,
    white_balance: 1,
    f_number: 1,
    flash: 1,
    ev: 1
  )
  user = User.create(id: 1)
  
  it "must have many photos" do
    expect(user.photos.length).to eq 1
  end
end

