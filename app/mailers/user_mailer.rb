class UserMailer < ApplicationMailer
  default from: "qwerty.wla@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'qwerty.wla@gmail.com',
         subject: "A new contact form message from #{name}")
  end
end

def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  UserMailer.contact_form(@email, @name, @message).deliver_now
end
