class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :vehicle_id
      t.integer :permit_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps

    end
  end
end
