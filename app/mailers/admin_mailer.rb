class AdminMailer < ActionMailer::Base
  default from: "mari.maf@gmail.com"
  layout 'mailer'

 def thanks_volunteer(user)
    @user = user
    mail(to: @user.email, subject: 'Estas inscrito para este domingo!')
  end

end
