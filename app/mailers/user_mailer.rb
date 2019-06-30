class UserMailer < ApplicationMailer
  default from: "qwerty.wla@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'qwerty.wla@gmail.com',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "everything.qwertyful"
    mail(to: user.email,
      subject: "Welcome to #{@appname}!")
  end
end
