class Admin::ArtistPositionController < Admin::BaseController
  
  def update
    artist = Artist.find params[:artist_id]
    artist.insert_at params[:id]
    render :text => "ok"
  end
end
