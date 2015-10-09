class AddIsMultiplicableToUnregistredItem < ActiveRecord::Migration
  def change
    add_column :unregistred_items, :multiplicable, :boolean
  end
end
