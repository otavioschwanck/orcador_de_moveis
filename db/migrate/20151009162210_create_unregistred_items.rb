class CreateUnregistredItems < ActiveRecord::Migration
  def change
    create_table :unregistred_items do |t|
      t.string :description
      t.float :value
      t.float :qtd
      t.references :mobile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
