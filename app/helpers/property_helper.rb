module PropertyHelper
  
  def property code
    raw Property.value_by_code code
  end
end