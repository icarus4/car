class RenameHasAirbagAtCenterToHasAirbagAtFrontCenter < ActiveRecord::Migration
  def change
    rename_column :cars, :has_airbag_at_center, :has_airbag_at_front_center
  end
end
