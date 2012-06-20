class Admin::SortablePositionController < Admin::BaseController
  
  def update
    clazz = params[:class_name].to_s.classify.constantize
    instance = clazz.find params[:sortable_id]
    instance.insert_at params[:id]
    render :text => "ok"
  end
end
