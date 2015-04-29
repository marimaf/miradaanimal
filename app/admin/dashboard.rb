#encoding: utf-8
ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

       column do
         panel "Miembros inscritos para este domingo" do
            ul do
                Registration.where(:day => DateTime.now.end_of_week).map do |volunteer|
                    li  volunteer.member.name + "  |  " + volunteer.member.email + (volunteer.member.car ? " **TIENE AUTO** " : "")
                end
            end
            #button_to 'Enviar mail de recordatorio', { controller: "registrations", action: "create" }
         end
       end

       column do 
        panel "Donaciones últimos 30 días" do
            
          h1 do
            "Total: " + number_to_currency(Donation.where(:created_at => 30.days.ago.beginning_of_day..Time.now).sum(:amount), precision: 0, locale: :en).to_s
            end
            render partial: 'donations'
        end
       end

     end #columns
  end # content
end
