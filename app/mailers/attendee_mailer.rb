class AttendeeMailer < ActionMailer::Base
  default from: "no-reply@vestigo.co"

  def new_attendee(attendee)
  	
  	@attendee = attendee

  	mail(subject: "Your Vestigo Trip")
  end
end
