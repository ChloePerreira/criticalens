class Photo < ActiveRecord::Base
  validates :fid, uniqueness: true
  belongs_to :user
  has_many :critiques
end
