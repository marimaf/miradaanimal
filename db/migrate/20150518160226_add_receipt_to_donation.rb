class AddReceiptToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :receipt, :string
  end
end
