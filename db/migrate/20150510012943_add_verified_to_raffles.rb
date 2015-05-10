class AddVerifiedToRaffles < ActiveRecord::Migration
  def change
    add_column :raffles, :verified, :boolean
  end
end
