require 'rails_helper'

describe ".validates" do
  it "must have a medium_640 field" do
    expect(Photo.new(medium_640: nil)).to_not be_valid
  end

  it "must have a max_aperture_value field" do
    expect(Photo.new(max_aperture_value: nil)).to_not be_valid
  end

  it "must have a lens field" do
    expect(Photo.new(lens: nil)).to_not be_valid
  end

  it "must have a model field" do
    expect(Photo.new(model: nil)).to_not be_valid
  end

  it "must have a exposure_time field" do
    expect(Photo.new(exposure_time: nil)).to_not be_valid
  end

  it "must have a iso field" do
    expect(Photo.new(iso: nil)).to_not be_valid
  end

  it "must have a white_balance field" do
    expect(Photo.new(white_balance: nil)).to_not be_valid
  end

  it "must have a f_number field" do
    expect(Photo.new(f_number: nil)).to_not be_valid
  end

  it "must have a flash field" do
    expect(Photo.new(flash: nil)).to_not be_valid
  end

  it "must have a ev field" do
    expect(Photo.new(ev: nil)).to_not be_valid
  end

end
