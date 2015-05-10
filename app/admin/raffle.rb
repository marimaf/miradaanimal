ActiveAdmin.register Raffle do

scope :verificados
scope :no_verificados

index do
    column :event_number
    column :email
    column :receipt
    column :number
    column :verified
    actions
  end

end
