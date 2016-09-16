class MessageMailer < ApplicationMailer

  def contact_email(message)
    @message = message
    mail(from: @message.email, to: "admin@orchidhouse.com", subject: @message.subject)
  end
end
