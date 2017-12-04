class VisitorParkingPermit < ApplicationRecord
  # Direct associations

  belongs_to :resident_host,
             :class_name => "User",
             :foreign_key => "resident_id",
             :counter_cache => true

  # Indirect associations

  # Validations

end
