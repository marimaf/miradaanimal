class AddAttachmentPhoto1Photo2Photo3Photo4ToDogs < ActiveRecord::Migration
  def self.up
    change_table :dogs do |t|
      t.attachment :photo1
      t.attachment :photo2
      t.attachment :photo3
      t.attachment :photo4
    end
  end

  def self.down
    remove_attachment :dogs, :photo1
    remove_attachment :dogs, :photo2
    remove_attachment :dogs, :photo3
    remove_attachment :dogs, :photo4
  end
end
