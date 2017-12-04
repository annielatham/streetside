class Visit < ApplicationRecord
  # Direct associations

  belongs_to :visitor_permit,
             :class_name => "VisitorParkingPermit",
             :foreign_key => "permit_id"

  belongs_to :visiting_vehicle,
             :class_name => "Vehicle",
             :foreign_key => "vehicle_id",
             :counter_cache => :pass_uses_count

  # Indirect associations

  has_one    :resident_host,
             :through => :visitor_permit,
             :source => :resident_host

  # Validations

end
