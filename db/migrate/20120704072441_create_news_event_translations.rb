class CreateNewsEventTranslations < ActiveRecord::Migration
  def up
    NewsEvent.create_translation_table!({
      :content => :text
    }, {
      :migrate_data => true
    })
  end

  def down
    NewsEvent.drop_translation_table! :migrate_data => true
  end
end
