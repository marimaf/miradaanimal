ActiveAdmin.register Raffle do

scope :verificados
scope :no_verificados

index do
    column :event_number
    column :email
    column :receipt
    column :number
    column :verified
    column :miembro do |raffle|
    	Member.find_by_rut(raffle.email) ? "Miembro" : "---"
    end
    actions
  end

end
