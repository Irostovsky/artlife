class CategoriesController < ApplicationController
  
  before_filter :find_category
  
  def show
    @artists = @category.artists.by_position
  end
  
private

  def find_category
    @category = Category.find params[:id]
  end
  
end
