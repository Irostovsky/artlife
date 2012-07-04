class NewsEvent < ActiveRecord::Base
  attr_accessible :content
  translates :content
  include TranslatedModel
  
  validates :content, :presence => true
  
end
