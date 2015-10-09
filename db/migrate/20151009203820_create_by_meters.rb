class CreateByMeters < ActiveRecord::Migration
  def change
    create_table :by_meters do |t|
      t.float :width
      t.float :height
      t.float :meter_price
      t.integer :qtd
      t.boolean :multiplicable
      t.references :mobile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
