class Category < ActiveRecord::Base
  attr_accessible :name
  translates :name
  
  
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes

  class Translation
    attr_accessible :locale, :name
  end
  
  validates :name, :presence => true, :uniqueness => true
  
end
