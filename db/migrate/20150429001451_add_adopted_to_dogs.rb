class AddAdoptedToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :adopted, :boolean
  end
end
