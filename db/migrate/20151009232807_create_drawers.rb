class CreateDrawers < ActiveRecord::Migration
  def change
    create_table :drawers do |t|
      t.text :description
      t.float :width
      t.float :height
      t.float :front_plate
      t.float :internal
      t.float :slide
      t.integer :qtd
      t.references :mobile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
