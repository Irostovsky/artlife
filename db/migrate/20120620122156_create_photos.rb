class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :data
      t.references :artist
      t.integer :position
      t.timestamps
    end
  end
end
