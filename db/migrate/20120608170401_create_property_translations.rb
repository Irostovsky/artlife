class CreatePropertyTranslations < ActiveRecord::Migration
  def self.up
    Property.create_translation_table!({
      :value => :text
    }, {
      :migrate_data => true
    })
  end
  def self.down
    Property.drop_translation_table! :migrate_data => true
  end
end
