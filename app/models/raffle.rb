class Raffle < ActiveRecord::Base
  attr_accessible :email, :event_number, :number, :receipt
end
