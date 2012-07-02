class CreateMediaTranslations < ActiveRecord::Migration
  def up
    Media.create_translation_table!({
      :title => :string
    }, {
      :migrate_data => true
    })
  end

  def down
    Media.drop_translation_table! :migrate_data => true
  end
end
