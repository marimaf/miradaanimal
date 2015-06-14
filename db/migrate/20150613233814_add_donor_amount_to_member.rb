class AddDonorAmountToMember < ActiveRecord::Migration
  def change
    add_column :members, :donor_amount, :integer
  end
end
