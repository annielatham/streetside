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

  validates :activation_code, :uniqueness => { :scope => [:resident_id] }

  validates :activation_code, :presence => true

  validates :activation_code, :length => { :minimum => 12, :maximum => 12 }

  validates :activation_code, :inclusion => { :in => [ '2018vispass1', '2018vispass2', '2018vispass3', '2018vispass4' ]  }

  validates :expiration_date, :presence => true

  validates :purchase_date, :presence => true

  validates :resident_id, :presence => true

end
