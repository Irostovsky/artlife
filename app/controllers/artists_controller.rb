class ArtistsController < ApplicationController
   before_filter :find_category

  def index
    redirect_to category_path @category
  end

  def show
    @artist = @category.artists.find params[:id]
  end

private

  def find_category
    @category = Category.find params[:category_id]
  end

end
