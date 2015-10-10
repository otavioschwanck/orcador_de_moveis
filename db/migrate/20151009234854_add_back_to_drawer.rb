class AddBackToDrawer < ActiveRecord::Migration
  def change
    add_column :drawers, :back_plate, :float
  end
end
