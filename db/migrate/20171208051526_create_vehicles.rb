class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :year
      t.string :make
      t.string :model
      t.string :color
      t.string :nickname
      t.string :license_plate

      t.timestamps

    end
  end
end
