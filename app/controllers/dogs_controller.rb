class DogsController < InheritedResources::Base
  def welcome
  	@dogs = Dog.where(:adopted => [nil, false]).limit(15)
  end

end

