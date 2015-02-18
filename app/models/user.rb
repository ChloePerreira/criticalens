class User < ActiveRecord::Base
  validates :fid, presence: :true
  validates :name, presence: :true
  has_many :photos
end
