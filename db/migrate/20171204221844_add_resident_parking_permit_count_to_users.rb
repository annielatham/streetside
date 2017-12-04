class AddResidentParkingPermitCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :resident_parking_permits_count, :integer
  end
end
