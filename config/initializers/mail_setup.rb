ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "asciicasts.org",
  :user_name => "sprouttestingapp",
  :password => "nirojshrestha",
  :authentication => "plain",
  :enable_starttls_auto => true

}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"