class Media < ActiveRecord::Base
  attr_accessible :kind, :player_url, :position, :title
  belongs_to :artist
  
  translates :title
  include TranslatedModel

  acts_as_list :scope => [:artist, :kind]
  
  scope :by_position, order(:position)
  scope :audio, where(:kind => :audio)
  scope :video, where(:kind => :video)
  
end
