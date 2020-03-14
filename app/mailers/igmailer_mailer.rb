class IgmailerMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail(
      subject: "確認用メール",
      to: @contact.user.email,
      from: "text@example.com"
    )
  end
end
