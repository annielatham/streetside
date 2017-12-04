class User < ApplicationRecord
  # Direct associations

  has_many   :visitor_parking_permits,
             :foreign_key => "resident_id",
             :dependent => :nullify

  has_many   :resident_parking_permits,
             :foreign_key => "resident_id",
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
