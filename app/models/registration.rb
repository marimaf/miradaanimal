class Registration < ActiveRecord::Base
  attr_accessible :day, :member_id

  belongs_to :member
end
