class Photo < ActiveRecord::Base
  validates :fid, uniqueness: true
end
