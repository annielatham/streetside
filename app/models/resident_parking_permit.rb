class ResidentParkingPermit < ApplicationRecord
  # Direct associations

  belongs_to :permitted_resident_vehicle,
             :class_name => "Vehicle",
             :foreign_key => "vehicle_id",
             :counter_cache => true

  belongs_to :resident_car_owner,
             :class_name => "User",
             :foreign_key => "resident_id",
             :counter_cache => true

  # Indirect associations

  # Validations

end
