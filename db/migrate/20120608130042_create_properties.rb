class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :code
      t.text :value
      t.string :view

      t.timestamps
    end
  end
end
