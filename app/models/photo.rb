class Photo < ActiveRecord::Base
  validates :fid, uniqueness: true
  validates :medium_640, :max_aperture_value, :lens, :model, :exposure_time, :iso, :white_balance, :f_number, :flash, :ev,  presence: true
  belongs_to :user
  has_many :critiques
end
