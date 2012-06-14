class Admin::CategoryPositionController < Admin::BaseController
  
  def update
    category = Category.find params[:category_id]
    category.insert_at params[:id]
    render :text => "ok"
  end
end