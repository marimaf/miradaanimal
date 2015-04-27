class AddDateReceivedToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :date_received, :date
  end
end
