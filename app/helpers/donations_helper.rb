module DonationsHelper

	def norm_rut(old_rut)
		rut = old_rut.tr('.-','')
	  	rut = rut[0..rut.length-2] + "-"+rut[rut.length-1]
	  	rut = rut[0..rut.length-9] + "." + rut[rut.length-8..rut.length-6] + "." + rut[rut.length-5..rut.length] 
	  	return rut
	 end

end