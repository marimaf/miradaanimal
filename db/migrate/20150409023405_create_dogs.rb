class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.datetime :arrival_date
      t.string :gender
      t.string :size
      t.datetime :date_of_birth
      t.boolean :sterilized
      t.text :story
      t.text :comments

      t.timestamps
    end
  end
end
