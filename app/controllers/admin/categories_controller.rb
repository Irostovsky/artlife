class Admin::CategoriesController < Admin::BaseController
  before_filter :find_category, :only => [:edit, :update, :destroy, :show]

  def index
    @categories = Category.by_position
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new params[:category]
    if @category.save
      redirect_to admin_categories_path, :notice => 'Category added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes params[:category]
      redirect_to admin_categories_path, :notice => 'Category updated!'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, :notice => 'Category deleted!'
  end

  def show
    @artists = @category.artists.by_position
  end

private

  def find_category
    @category = Category.find params[:id]
  end

end
