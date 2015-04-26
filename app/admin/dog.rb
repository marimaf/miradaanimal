ActiveAdmin.register Dog do

form :html => { :enctype => "multipart/form-data" } do |f|
   f.inputs "Details" do
    f.input :name
    #f.input :date_of_birth, :as => :date
    #f.input :arrival_date, :as => :date
    f.input :photo1, :as => :file
  end
  f.button 'Guardar'
 end

end
