class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :rut
      t.boolean :volunteer
      t.string :phone
      t.boolean :car
      t.string :occupation
      t.boolean :frequent_donor

      t.timestamps
    end
  end
end
