class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :artists, :dependent => :destroy

  translates :name
  include TranslatedModel
  acts_as_list

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :presence => true, :uniqueness => true

  scope :by_position, order(:position)

end
