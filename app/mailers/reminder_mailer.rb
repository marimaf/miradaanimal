#encoding: utf-8
class ReminderMailer < MandrillMailer::MessageMailer
  require 'mandrill'
  default from: 'mari.maf@gmail.com'

  def remind_volunteer()
    # in this example `invitation.invitees` is an Array
    volunteers_arr = Member.where(:volunteer => true)
    volunteers = volunteers_arr.map { |volunteer| { email: volunteer.email, name: volunteer.name } }

    email_template = ActionController::Base.new.render_to_string('reminder_mailer/reminder', :layout => false)

    # no need to set up template and template_content attributes, set up the html and text directly
    mandrill_mail subject: "Te invitamos al operativo de este domingo!",
      to: volunteers,
      # to: invitation.email,
      # to: { email: invitation.email, name: 'Honored Guest' },
      text: "Te invitamos al operativo este domingo! Escríbete acá: http://miradaanimal.herokuapp.com/operativo",
      html: email_template,
      important: true,
      inline_css: true
  end
end