class Admin::PropertiesController < Admin::BaseController

  before_filter :find_property, :only => [:edit, :update]

  def index
    @properties = Property.all_by_keys
  end

  def edit
  end

  def update
    if @property.update_attributes params[:property]
      redirect_to admin_properties_path, :notice => 'Property updated!'
    else
      render :edit
    end
  end

private

  def find_property
    @property = Property.find_or_create_by_code params[:id]
    raise "No property found with code: #{params[:id]}" unless @property
  end
end
