class Member < ActiveRecord::Base
  attr_accessible :car, :email, :frequent_donor, :name, :occupation, :phone, :rut, :volunteer

  has_many :registrations
  has_many :donations

  validates :email, :presence => true,
                    :uniqueness => true

  scope :este_domingo, joins(:registrations).where("registrations.day" => DateTime.now.end_of_week.at_midnight) 
end
