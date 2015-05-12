class ChangeReceiptToRaffle < ActiveRecord::Migration
  def up
  	change_column :raffles, :receipt,  :string
  end

  def down
  	change_column :raffles, :receipt,  :integer
  end
end
