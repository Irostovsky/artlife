class Property < ActiveRecord::Base
  attr_accessible :code, :value, :view
  
  validates :code, :view, :presence => true 
  validates :code, :uniqueness => true 
  
  def self.value_by_code(code)
    self.find_by_code(code).try(:value)
  end
  
  def to_param
    code
  end
  
  def edit_column
    case view.to_sym
    when :string
      :text_field
    when :text
      :text_area
    end
  end
end
