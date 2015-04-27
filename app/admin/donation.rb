ActiveAdmin.register Donation do

    
      index do
      	column :member_id do |donation|
      		donation.member.name
      	end
      	column :amount
      	column :date_received

      end
    
   form :html => { :enctype => "multipart/form-data" } do |f|
   f.inputs "Details" do
    f.input :member_id, :as => :select, :collection => Member.all
    f.input :amount
    f.input :date_received, :as => :datepicker
  end
  f.button 'Guardar'
 end

end
