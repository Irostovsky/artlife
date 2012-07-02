class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media_urls do |t|
      t.string :title
      t.string :player_url
      t.string :kind
      t.integer :position
      t.references :artist

      t.timestamps
    end
  end
end
