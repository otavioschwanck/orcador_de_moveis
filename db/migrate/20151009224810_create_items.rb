class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :value
      t.text :description
      t.text :who_sell
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
