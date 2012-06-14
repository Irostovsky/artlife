class CategoriesController < ApplicationController
  
  before_filter :find_category
  
  def show
  end
  
private

  def find_category
    @category = Category.find params[:id]
  end
  
end
