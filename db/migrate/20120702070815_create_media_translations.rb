class CreateMediaTranslations < ActiveRecord::Migration
  def up
    MediaUrl.create_translation_table!({
      :title => :string
    }, {
      :migrate_data => true
    })
  end

  def down
    MediaUrl.drop_translation_table! :migrate_data => true
  end
end
