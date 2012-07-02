class Admin::MediaUrlsController < Admin::BaseController
  before_filter :find_artist

  def new
    @media_url = MediaUrl.new :kind => params[:kind]
  end
  
  def create
    @media_url = @artist.media_urls.build params[:media_url]
    if @media_url.save
      render :create
    else
      render :new
    end
  end

  def edit
    @media_url = @artist.media_urls.find params[:id]
    render :new
  end

  def update
    @media_url = @artist.media_urls.find params[:id]
    if @media_url.update_attributes params[:media_url]
      render :update
    else
      render :new
    end
  end


  def destroy
    @media_url = @artist.media_urls.find params[:id]
    @media_url.destroy
  end
  
private  

  def find_artist
    @artist = Artist.find params[:artist_id]
  end
  
end
