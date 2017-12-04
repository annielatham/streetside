class VisitorParkingPermit < ApplicationRecord
  # Direct associations

  has_many   :assigned_visits,
             :class_name => "Visit",
             :foreign_key => "permit_id",
             :dependent => :destroy

  belongs_to :resident_host,
             :class_name => "User",
             :foreign_key => "resident_id",
             :counter_cache => true

  # Indirect associations

  # Validations

end
