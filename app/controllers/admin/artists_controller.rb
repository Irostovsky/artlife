class Admin::ArtistsController < Admin::BaseController
  before_filter :find_category
  before_filter :find_artist, :only => [:edit, :update, :destroy, :show]

  def index
    redirect_to admin_category_path @category
  end

  def new
    @artist = Artist.new(:category => @category)
  end

  def create
    @artist = Artist.new params[:artist]
    if @artist.save
      redirect_to admin_category_artist_path(@category, @artist), :notice => 'Artist added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @artist.update_attributes params[:artist]
      redirect_to admin_category_artist_path(@category, @artist), :notice => 'Artist updated!'
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to admin_category_path(@category), :notice => 'Artist deleted!'
  end

  def show
  end

private

  def find_category
    @category = Category.find params[:category_id]
  end

  def find_artist
    @artist = @category.artists.find params[:id]
  end

end
