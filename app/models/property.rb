class Property < ActiveRecord::Base
  attr_accessible :code, :value, :view
  translates :value

  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes

  class Translation
    attr_accessible :locale, :value
  end

  def value_by_locale(locale)
    self.translations.find_by_locale(locale).try :value
  end

  CODES = {
      :contacts => :text,
      :skype_name => :string,
      :icq_name => :string,
      :about_us_page => :text
      }

  validates :code, :view, :presence => true
  validates :code, :uniqueness => true

  def self.value_by_code(code)
    self.find_by_code(code).try :value
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
