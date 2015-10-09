class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :description
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
