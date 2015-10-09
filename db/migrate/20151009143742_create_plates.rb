class CreatePlates < ActiveRecord::Migration
  def change
    create_table :plates do |t|
      t.float :width
      t.float :height
      t.float :plate_value
      t.integer :qtd
      t.references :mobile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
