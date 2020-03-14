class IgmailerMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail(
      subject: "確認用メール",
      to: "fujita_19740909_j@yahoo.co.jp",
      from: "text@example.com"
    )
    # mail to: "fujita_19740909_j@yahoo.co.jp", subject: "確認用メール"
  end
end
