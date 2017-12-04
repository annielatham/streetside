class Visit < ApplicationRecord
  # Direct associations

  belongs_to :visiting_vehicle,
             :class_name => "Vehicle",
             :foreign_key => "vehicle_id",
             :counter_cache => :pass_uses_count

  # Indirect associations

  # Validations

end
