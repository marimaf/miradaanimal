class AddMemberIdToDog < ActiveRecord::Migration
  def change
    add_column :dogs, :member_id, :integer
  end
end
