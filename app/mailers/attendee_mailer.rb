class AttendeeMailer < ActionMailer::Base
  default from: "no-reply@vestigo.co"

  def mandrill_client
  	@mandrill_client ||= Mandrill::API.new MANDRILL_KEY
  end

  def new_attendee(attendee)
  	template_name = 'new-attendee'
  	template_content = []
  	message = {
  		to: [{email: attendee.email}],
  		subject: "Your Vestigo trip",
  		merge_vars:[
  			{rcpt: attendee.email,
  				vars: [
  					{name: "ATTENDEE_NAME", content: attendee.name},
            {name: "TRIP_TITLE", content: attendee.trip.title}
  				]
  			}
  		]
  	}

  	mandrill_client.messages.send_template template_name, template_content, message
  end

  def admin_message(attendee)
    @attendee = attendee
    mail(to: "daniel@vestigo.co", subject: "New sign up on the trip to #{@attendee.trip.title}")
  end

end
