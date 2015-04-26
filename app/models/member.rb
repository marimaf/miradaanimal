class Member < ActiveRecord::Base
  attr_accessible :car, :email, :frequent_donor, :name, :occupation, :phone, :rut, :volunteer

  has_many :registrations

  validates :email, :presence => true,
                    :uniqueness => true
end
