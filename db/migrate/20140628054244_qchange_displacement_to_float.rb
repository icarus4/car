class QchangeDisplacementToFloat < ActiveRecord::Migration
  def change
    change_column :cars, :displacement, :float
  end
end
