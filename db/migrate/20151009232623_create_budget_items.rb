class CreateBudgetItems < ActiveRecord::Migration
  def change
    create_table :budget_items do |t|
      t.references :item, index: true, foreign_key: true
      t.float :qtd
      t.boolean :multiplicable
      t.references :mobile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
