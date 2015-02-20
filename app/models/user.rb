class User < ActiveRecord::Base
  validates :fid, presence: :true
  validates :name, presence: :true
  #validates_format_of :email, :with => /@/
  has_many :photos
end
