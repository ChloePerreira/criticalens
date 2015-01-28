require 'httparty'
require 'active_support/all'
class Flickr

  def self.photo_hash(flickr_id)
    id_hash_array = self.get_photos(flickr_id)
    complete_hash_array = []
    id_hash_array[0..10].each do |hash| #LIMITED - change this later
      url_hash = self.get_urls(hash[:id])
      combined = hash.merge(url_hash)
      complete_hash_array.push(combined)
    end
    complete_hash_array
  end

  def self.get_photos(fid)
    response = self.response("flickr.people.getPublicPhotos", "user_id", fid)
    photos = response['rsp']['photos']['photo']
    photo_array = []
    photos.each do |hash_element|
      photo_array.push({:id =>hash_element["id"]})
    end
    photo_array
  end

  def self.get_urls(fid)
    response = self.response("flickr.photos.getSizes", "photo_id", fid)
    response = response['rsp']['sizes']['size']
    url_hash = {}
    response.each do |hash_element|
      url_hash[hash_element["label"].downcase.gsub(/\s+/, "_").to_sym] = hash_element['source']
    end
    url_hash.slice(:large_square, :small, :small_320, :medium_640, :medium_800)
  end

  def self.get_exif(fid)
  end

  def self.response(method, id_type, id)
    url = "https://api.flickr.com/services/rest/?&method=#{method}&api_key=#{ENV['FLICKR_KEY']}&#{id_type}=#{id}"
    response = HTTParty.get(url)
    response = response.parsed_response
  end

end
