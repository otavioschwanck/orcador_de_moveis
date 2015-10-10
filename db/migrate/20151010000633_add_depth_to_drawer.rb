class AddDepthToDrawer < ActiveRecord::Migration
  def change
    add_column :drawers, :depth, :float
  end
end
