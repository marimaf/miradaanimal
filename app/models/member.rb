class Member < ActiveRecord::Base
  attr_accessible :car, :email, :frequent_donor, :name, :occupation, :phone, :rut, :volunteer, :emergency_contact_name, :emergency_contact_phone, :health

  has_many :registrations
  has_many :donations

  validates :email, :presence => true,
                    :uniqueness => true

  scope :este_domingo, joins(:registrations).where("registrations.day" => DateTime.now.end_of_week.at_midnight) 

  def norm_rut
  	if !self.rut.nil?
	  	rut = self.rut.tr('.-','')
	  	rut = rut[0..rut.length-2] + "-"+rut[rut.length-1]
	  	rut = rut[0..rut.length-9] + "." + rut[rut.length-8..rut.length-6] + "." + rut[rut.length-5..rut.length] 
	  	self.rut = rut
	end
  end

end
