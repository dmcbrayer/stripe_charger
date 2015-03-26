MANDRILL_KEY = "OACVpiS15ADon3HxmUxNLA"

ActionMailer::Base.smtp_settings = {
	address:  "smtp.mandrillapp.com",
	port: 587,
	enable_starttls_auto: true,
	user_name: "daniel@vestigo.co",
	password: MANDRILL_KEY,
	authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp unless Rails.env == "test"
ActionMailer::Base.default charset: "utf-8"