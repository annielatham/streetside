class Vehicle < ApplicationRecord
  # Direct associations

  has_many   :pass_uses,
             :class_name => "Visit",
             :dependent => :nullify

  has_many   :resident_parking_permits,
             :dependent => :nullify

  # Indirect associations

  has_many   :resident_car_owners,
             :through => :resident_parking_permits,
             :source => :resident_car_owner

  # Validations

end
