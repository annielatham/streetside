class AddResidentParkingPermitCountToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :resident_parking_permits_count, :integer
  end
end
