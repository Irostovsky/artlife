class CreateNewsEvents < ActiveRecord::Migration
  def change
    create_table :news_events do |t|
      t.text :content

      t.timestamps
    end
  end
end
