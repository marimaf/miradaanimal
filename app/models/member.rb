class Member < ActiveRecord::Base
  attr_accessible :car, :email, :frequent_donor, :name, :occupation, :phone, :rut, :volunteer, :emergency_contact_name, :emergency_contact_phone, :health, :donor_amount

  has_many :registrations
  has_many :donations
  has_many :dogs

  validates :email, :presence => true,
                    :uniqueness => true

  scope :voluntarios_domingo, joins(:registrations).where("registrations.day" => DateTime.now.end_of_week.at_midnight) 
  scope :donante_frecuente, where(:frequent_donor => true)
  scope :padrinos, joins(:dogs).where("dogs.member_id IS NOT NULL" )

  def norm_rut
  	if !self.rut.nil?
	  	rut = self.rut.tr('.-','')
	  	rut = rut[0..rut.length-2] + "-"+rut[rut.length-1]
	  	rut = rut[0..rut.length-9] + "." + rut[rut.length-8..rut.length-6] + "." + rut[rut.length-5..rut.length] 
	  	self.rut = rut
	  end
  end

end
