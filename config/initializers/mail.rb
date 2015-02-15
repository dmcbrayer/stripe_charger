MANDRILL_API_KEY = ENV['MANDRILL_API_KEY']

ActionMailer::Base.smtp_settings = {
	address:  "smtp.mandrillapp.com",
	port: 587,
	enable_starttls_auto: true,
	user_name: "daniel@vestigo.co",
	password: MANDRILL_API_KEY,
	authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"