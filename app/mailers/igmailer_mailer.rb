class IgmailerMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: "fujita0909j@gmail.com", subject: "確認用メール"
  end
end
