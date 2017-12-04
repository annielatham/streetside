class AddVisitorParkingPermitCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :visitor_parking_permits_count, :integer
  end
end
