ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "headfitted.com",
  :user_name            => "service@headfitted.com",
  :password             => "p@ssw0rd000",
  :authentication       => "plain",  
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"