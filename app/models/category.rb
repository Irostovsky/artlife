class Category < ActiveRecord::Base
  attr_accessible :name
  translates :name
  include TranslatedModel
  acts_as_list
  validates :name, :presence => true, :uniqueness => true

  scope :by_position, order(:position)
end
