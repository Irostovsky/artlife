class MediaUrl < ActiveRecord::Base
  attr_accessible :kind, :player_url, :position, :title, :artist
  belongs_to :artist
  
  translates :title
  include TranslatedModel

  acts_as_list :scope => [:kind, :artist_id]
  
  scope :by_position, order(:position)
  scope :audio, where(:kind => :audio)
  scope :video, where(:kind => :video)
  
  validates :title, :player_url, :presence => true
  
end
