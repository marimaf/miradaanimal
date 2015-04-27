desc "This task is called by the Heroku scheduler add-on"
task :remind_volunteer => :environment do
 
  #if Time.now.wday = 2 #tuesday
	ReminderMailer.remind_volunteer().deliver
  #end

end
