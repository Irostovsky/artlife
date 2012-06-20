module ArtistHelper
  
  def main_photo artist
    photo = artist.photos.first || Photo.new
    photo.data(:big)
  end
end