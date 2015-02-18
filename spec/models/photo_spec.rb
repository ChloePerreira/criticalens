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
end
