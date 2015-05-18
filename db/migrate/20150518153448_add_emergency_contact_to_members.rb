class AddEmergencyContactToMembers < ActiveRecord::Migration
  def change
    add_column :members, :emergency_contact_name, :string
    add_column :members, :emergency_contact_phone, :string
    add_column :members, :health, :string
  end
end
