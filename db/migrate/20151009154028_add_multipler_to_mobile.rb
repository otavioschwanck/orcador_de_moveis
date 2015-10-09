class AddMultiplerToMobile < ActiveRecord::Migration
  def change
    add_column :mobiles, :multiplier, :float
  end
end
