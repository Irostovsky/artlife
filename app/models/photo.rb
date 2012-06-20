class Photo < ActiveRecord::Base
  attr_accessible :data, :artist
  has_attached_file :data, :styles => { :content => 'x400>', :preview => 'x100>',:thumb => '100x100#' }

 	validates_attachment_size :data, :less_than => 2.megabytes
 	validates_attachment_presence :data
  
  belongs_to :artist
  acts_as_list :scope => :artist
  scope :by_position, order(:position)
  
end
