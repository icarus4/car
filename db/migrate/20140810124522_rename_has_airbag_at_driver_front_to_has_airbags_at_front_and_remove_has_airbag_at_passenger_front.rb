class RenameHasAirbagAtDriverFrontToHasAirbagsAtFrontAndRemoveHasAirbagAtPassengerFront < ActiveRecord::Migration
  def change
    rename_column :cars, :has_airbag_at_driver_front, :has_airbags_at_front
    remove_column :cars, :has_airbag_at_passenger_front
  end
end
