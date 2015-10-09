class CreateMobiles < ActiveRecord::Migration
  def change
    create_table :mobiles do |t|
      t.string :name
      t.string :description
      t.references :budget, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
