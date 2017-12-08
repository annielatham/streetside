class AddActivationCodeToVisitorParkingPermits < ActiveRecord::Migration[5.0]
  def change
    add_column :activation_code, :string
  end
end
