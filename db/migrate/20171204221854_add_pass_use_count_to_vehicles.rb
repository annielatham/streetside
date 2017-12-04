class AddPassUseCountToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :pass_uses_count, :integer
  end
end
