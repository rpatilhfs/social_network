class Mailer < ActionMailer::Base
  default from: "headfitted@mailinator.com"
  
  def account_confirmation(email, user, subject)
    @user_name = user
    mail(:to => email, :subject => subject)
  end

  def welcome_message(email, user, subject)
    @user_name = user
    mail(:to => email, :subject => subject)
  end


  
end
