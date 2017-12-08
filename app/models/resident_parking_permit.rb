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

  validates :activation_code, :uniqueness => { :scope => [:resident_id] }

  validates :activation_code, :presence => true

  validates :activation_code, :length => { :minimum => 12, :maximum => 12 }

  validates :activation_code, :inclusion => { :in => [ '2018respass1', '2018respass2', '2018respass3', '2018respass4' ]  }

  validates :expiration_date, :presence => true

  validates :purchase_date, :presence => true

  validates :resident_id, :presence => true

  validates :vehicle_id, :presence => true

end
