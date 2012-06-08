# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Property.destroy_all

FactoryGirl.create :user
FactoryGirl.create :property, :code => 'contacts', :view => "text", :value => 'Tel: 123-123-123'