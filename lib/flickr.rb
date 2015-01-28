require 'httparty'
class Flickr

  def self.get_photos(fid)
    response = self.response("flickr.people.getPublicPhotos", "user_id", fid)
    photos = response['rsp']['photos']['photo']
    photo_array = []
    photos.each do |hash_element|
      photo_array.push(hash_element["id"])
    end
    photo_array
  end

  def self.get_url(fid)
    response = self.response("flickr.photos.getSizes", "photo_id", fid)
    x = response['rsp']['sizes']['size']
    url_hash = {}
    x.each do |hash_element|
      url_hash[hash_element["label"]] = hash_element['source']
    end
    url_hash
  end

  def self.response(method, id_type, id)
    url = "https://api.flickr.com/services/rest/?&method=#{method}&api_key=#{ENV['FLICKR_KEY']}&#{id_type}=#{id}"
    response = HTTParty.get(url)
    response = response.parsed_response
  end

end
