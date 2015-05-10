class CreateRaffles < ActiveRecord::Migration
  def change
    create_table :raffles do |t|
      t.string :email
      t.integer :number
      t.integer :receipt
      t.integer :event_number

      t.timestamps
    end
  end
end
