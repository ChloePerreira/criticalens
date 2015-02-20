class User < ActiveRecord::Base
  validates :fid, presence: :true
  validates :name, presence: :true
  #validates_format_of :email, :with => /@/
  has_many :photos

  def critiques_received
    qty = 0
    self.photos.each do |photo|
      qty += photo.get_critiques.length
    end
    return qty
  end

end
