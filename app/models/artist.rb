class Artist < ActiveRecord::Base
  attr_accessible :biography, :country, :position, :title, :category, :category_id
  belongs_to :category
  has_many :photos, :dependent => :destroy
  has_many :media_urls, :dependent => :destroy

  translates :biography, :country, :title
  include TranslatedModel

  acts_as_list :scope => :category

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :country, :presence => true

  scope :by_position, order(:position)

end
