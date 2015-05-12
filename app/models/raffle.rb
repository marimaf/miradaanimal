class Raffle < ActiveRecord::Base
  attr_accessible :email, :event_number, :number, :receipt, :verified

  scope :verificados, where("verified" => true)
  scope :no_verificados, where("verified" => [false, nil])
end
