class Dog < ActiveRecord::Base
  attr_accessible :arrival_date, :comments, :date_of_birth, :gender, :adopted, :name, :size, :sterilized, :story, :photo1, :photo2, :photo3, :photo4
  has_attached_file :photo1, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo1, :content_type => /\Aimage\/.*\Z/
    has_attached_file :photo2, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo2, :content_type => /\Aimage\/.*\Z/
    has_attached_file :photo3, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo3, :content_type => /\Aimage\/.*\Z/
    has_attached_file :photo4, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo4, :content_type => /\Aimage\/.*\Z/


  scope :adoptados, where("adopted" => true)
  scope :por_adoptar, where("adopted" => false)

  belongs_to :member
end
