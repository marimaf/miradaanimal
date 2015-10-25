class DogsController < InheritedResources::Base
  def welcome
  	@dogs = Dog.where(:adopted => [nil, false]).limit(15)
  end

  #returns the dogs that are not adopted, aka waiting in the shelter to be adopted
  def waitlist

  	@dogs = Dog.where(:adopted => [nil, false]).limit(25)

  	respond_to do |format|
      format.html # index.html.erb
      format.json #{ render json: @dogs }
    end
  end

  def waitlistview

  end

end

