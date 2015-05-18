class Donation < ActiveRecord::Base
  attr_accessible :amount, :member_id, :email, :receipt

  belongs_to :member

end
