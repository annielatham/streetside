class Vehicle < ApplicationRecord
  # Direct associations

  has_many   :resident_parking_permits,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
