ActiveAdmin.register Member do

scope :voluntarios_domingo
scope :donante_frecuente
scope :padrinos

index do
    column :name
    column :email
    column :rut
    column :phone
    column :volunteer
    column :occupation
    column :frequent_donor
    
    actions
  end

end
