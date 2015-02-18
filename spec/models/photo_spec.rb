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

describe Photo do
  let!(:photo) do
    Photo.create(
      user_id: 1,
      fid: "1",
      medium_640: "1",
      max_aperture_value: "1",
      lens: "1",
      model: "1",
      exposure_time: "1",
      iso: "1",
      white_balance: "1",
      f_number: "1",
      flash: "1",
      ev: "1"
    )
  end

  let!(:critique) do
    Critique.create(
      author: 1,
      fid: "1", 
      sugg_ap: "2.0",
      sugg_sh: "1/50",
      sugg_iso: "200"
    )
  end

  describe ".has_critiques?" do
    it "has critiques" do
      expect(photo.has_critiques?).to eq true
    end
  end
end

