class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :title
      t.string :country
      t.text :biography
      t.integer :position
      t.references :category
      
      t.timestamps
    end
  end
end
