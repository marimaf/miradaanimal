#encoding: utf-8
class AdminMailer < ActionMailer::Base
  default from: "Mirada Animal Chile <mari.maf@gmail.com>"
  #layout 'mailer'

  def thanks_volunteer(user)
    @user = user
    mail(to: @user.email, subject: 'Estas inscrito para este domingo!')
  end

   def thanks_raffle(email, numbers)
    @numbers = numbers
    mail(to: email, subject: 'Ya estás participando en la rifa!')
  end

  def thanks_donation(email)
    mail(to: email, subject: 'Gracias por tu donación!')
  end

end
