class Admin::PhotosController < Admin::BaseController
  before_filter :find_artist
  
  def create
    @photo = Photo.create(:data => params[:files].first, :artist => @artist)
  end

  def destroy
    @photo = @artist.photos.find params[:id]
    @photo.destroy
  end
  
private  

  def find_artist
    @artist = Artist.find params[:artist_id]
  end
  
end
