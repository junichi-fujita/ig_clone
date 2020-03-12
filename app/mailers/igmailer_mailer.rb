class IgmailerMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: "fujita_19740909_j@yahoo.co.jp", subject: "確認用メール"
  end
end
