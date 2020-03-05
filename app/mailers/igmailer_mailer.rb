class IgmailerMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: @contact.user.email, subject: "確認用メール"
  end
end
