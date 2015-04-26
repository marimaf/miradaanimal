class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :member_id
      t.datetime :day

      t.timestamps
    end
  end
end
