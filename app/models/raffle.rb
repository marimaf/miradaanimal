class Raffle < ActiveRecord::Base
  attr_accessible :email, :event_number, :number, :receipt, :verified

  scope :verificados, where("verified" => true, :event_number => 3)
  scope :no_verificados, where("verified" => [false, nil], :event_number => 3)
end
