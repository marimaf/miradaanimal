ActiveAdmin.register Member do

scope :este_domingo

index do
    column :name
    column :email
    column :rut
    column :phone
    column :car
    column :volunteer
    column :occupation
    column :frequent_donor
    
    actions
  end

end
