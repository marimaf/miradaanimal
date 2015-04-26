class Donation < ActiveRecord::Base
  attr_accessible :amount, :member_id

  belongs_to :member

end
