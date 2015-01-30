require 'httparty'
require 'active_support/all'
class Flickr

  def self.get_photos(fid)
    # append to endpoint to get urls of the photos
    extras = "&extras=url_q,url_m,url_n,url_z,url_c"
    # get users public photos
    response = self.response("flickr.people.getPublicPhotos", "user_id", fid, extras)
    # photos are buried in hash
    photos = response['rsp']['photos']['photo']
    # will be an array of hashes containing photo data
    photo_array = []
    photos.each do |hash_element|
      photo_array.push(
        {
          :id => hash_element["id"], 
          :large_square => hash_element["url_q"], 
          :small => hash_element["url_m"], 
          :small_320 => hash_element["url_n"], 
          :medium_640 => hash_element["url_z"], 
          :medium_800  => hash_element["url_c"] 
        }
      )
    end
    photo_array
  end

  def self.get_exif(fid)
    # get Exif data
    response = self.response("flickr.photos.getExif", "photo_id", fid, nil)
    # get actual data out of horrible flickr hash
    exif = response['rsp']['photo']['exif']
    # fill this new hash with the data that you want
    exif_hash = {}
    exif.each do |hash_element|
      exif_hash[hash_element['tag'].to_sym] = hash_element['raw']
    end
    exif_hash.slice(
      :Model, 
      :Lens, 
      :FocalLength, 
      :MaxApertureValue, 
      :ExposureTime, 
      :ISO, 
      :WhiteBalance,
      :FNumber, 
      :ExposureCompensation,
      :Flash)
  end

  def self.response(method, id_type, id, extras)
    url = "https://api.flickr.com/services/rest/?&method=#{method}&api_key=#{ENV['FLICKR_KEY']}&#{id_type}=#{id}#{extras}"
    response = HTTParty.get(url)
    response = response.parsed_response
  end

  #def self.photo_hash(flickr_id)
    #id_hash_array = self.get_photos(flickr_id)
    #complete_hash_array = []
    #id_hash_array[0..11].each do |hash| #LIMITED - change this later
      #url_hash = self.get_urls(hash[:id])
      #combined = hash.merge(url_hash)
      #complete_hash_array.push(combined)
    #end
    #complete_hash_array
    #id_hash_array
  #end

  #def self.get_photos(fid)
  #  response = self.response("flickr.people.getPublicPhotos", "user_id", fid, nil)
  #  photos = response['rsp']['photos']['photo']
  #  photo_array = []
  #  photos.each do |hash_element|
  #    photo_array.push({:id =>hash_element["id"]})
  #  end
  #  photo_array
  #end

  #def self.get_urls(fid)
  #  response = self.response("flickr.photos.getSizes", "photo_id", fid, nil)
  #  response = response['rsp']['sizes']['size']
  #  url_hash = {}
  #  response.each do |hash_element|
  #    url_hash[hash_element["label"].downcase.gsub(/\s+/, "_").to_sym] = hash_element['source']
  #  end
  #  url_hash.slice(:large_square, :small, :small_320, :medium_640, :medium_800)
  #end
end
