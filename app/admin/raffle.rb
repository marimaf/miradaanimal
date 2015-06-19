ActiveAdmin.register Raffle do

scope :verificados
scope :no_verificados

index do
    column :event_number
    column :email
    column :receipt
    column :number
    column :verified do |raffle|
        button_to raffle.verified ? "Si" : "No", toggle_verified_path(:id => raffle.id)
    end
    column :miembro do |raffle|
    	Member.find_by_rut(raffle.email) ? "Miembro" : "---"
    end
    actions
  end

end
