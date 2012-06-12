class Category < ActiveRecord::Base
  attr_accessible :name
  translates :name
  include TranslatedModel

  validates :name, :presence => true, :uniqueness => true

end
