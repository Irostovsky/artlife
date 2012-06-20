module ArtistHelper
  
  def main_photo artist
    photo = artist.photos.by_position.first || Photo.new
    photo.data(:big)
  end
end