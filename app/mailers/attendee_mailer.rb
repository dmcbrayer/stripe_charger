class AttendeeMailer < ActionMailer::Base
  default from: "no-reply@vestigo.co"

  def mandrill_client
  	@mandrill_client ||= Mandrill::API.new MANDRILL_API_KEY
  end

  #def new_attendee(attendee)
  #	@attendee = attendee
  #	mail(to: @attendee.email, subject: "Your Vestigo Trip")
  #end

  def new_attendee(attendee)
  	template_name = 'new-attendee'
  	template_content = []
  	message = {
  		to: [{email: "dmcbrayer@gmail.com", name: "Daniel McBrayer"}],
  		subject: "New Attendee: #{attendee.name}",
  		merge_vars:[
  			{rcpt: "dmcbrayer@gmail.com",
  				vars: [
  					{name: "ATTENDEE_NAME", content: attendee.name}
  				]
  			}
  		]
  	}

  	mandrill_client.messages.send_template template_name, template_content, message
  end
end
