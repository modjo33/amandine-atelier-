class NewsletterMailer < ApplicationMailer
  def send_article(contact, article)
    @contact = contact
    @article = article
    @unsubscribe_url = unsubscribe_url(token: contact.unsubscribe_token)

    mail(
      to: contact.email,
      subject: article.title,
      from: "Amandine Atelier Digital <contact@amandineatelierdigital.fr>"
    )
  end
end
