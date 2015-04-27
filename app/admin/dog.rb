#encoding: utf-8
ActiveAdmin.register Dog do

index do
    column :name
    column :sterilized
    column :gender
    column :size
    column :date_of_birth
    column :arrival_date
    column :photo1 do |dog|
    	image_tag dog.photo1.url(:thumb)
    end
    actions
  end


form :html => { :enctype => "multipart/form-data" } do |f|
   f.inputs "Details" do
    f.input :name
    f.input :sterilized
    f.input :gender, collection: ["Macho", "Hembra"]
    f.input :size, collection: ["Pequeño", "Mediano", "Grande"]
    f.input :date_of_birth, :as => :datepicker
    f.input :arrival_date, :as => :datepicker
    f.input :photo1, :as => :file
    f.input :photo2, :as => :file
    f.input :photo3, :as => :file
    f.input :photo4, :as => :file
    f.input :story
    f.input :comments
  end
  f.button 'Guardar'
 end

end
