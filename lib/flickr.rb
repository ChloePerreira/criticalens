require 'httparty'
class Flickr

  def self.get_photos(fid)
    url = "https://api.flickr.com/services/rest/?&method=flickr.people.getPublicPhotos&api_key=#{ENV['FLICKR_KEY']}&user_id=#{fid}"
    response = HTTParty.get(url)
    response = response.parsed_response
    photos = response['rsp']['photos']['photo']
    photo_array = []
    photos.each do |hash_element|
      photo_array.push(hash_element["id"])
    end
    photo_array
  end

  def self.get_url(fid)
    url = "https://api.flickr.com/services/rest/?&method=flickr.photos.getSizes&api_key=#{ENV['FLICKR_KEY']}&photo_id=#{fid}"
    response = HTTParty.get(url)
    response = response.parsed_response
    x = response['rsp']['sizes']['size']
    url_hash = {}
    x.each do |hash_element|
      url_hash[hash_element["label"]] = hash_element['source']
    end
    url_hash
  end

end
