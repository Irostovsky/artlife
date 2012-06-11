class Property < ActiveRecord::Base
  attr_accessible :code, :value, :view
  translates :value
  class Translation
    attr_accessible :locale
  end

  CODES = {
      :contacts => :text,
      :skype_name => :string
      }


  validates :code, :view, :presence => true
  validates :code, :uniqueness => true

  def self.value_by_code(code)
    self.find_by_code(code).try(:value)
  end

  def self.all_by_keys
    CODES.keys.map{|code| self.find_or_create_by_code code}
  end

  def self.find_or_create_by_code code
    self.find_by_code(code) || self.create(:code => code, :view => CODES[code]) if CODES.keys.include?(code.to_sym)
  end

  def to_param
    code
  end

  def edit_column
    case view.to_sym
    when :string
      :text_field
    when :text
      :cktext_area
    end
  end
end
