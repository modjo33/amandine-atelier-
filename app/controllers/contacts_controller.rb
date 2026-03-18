class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      # Si opt-in newsletter, créer un subscriber + sync Brevo
      if @contact.newsletter_opt_in?
        Subscriber.find_or_create_by(email: @contact.email) do |s|
          s.first_name = @contact.first_name
          s.source = "contact"
        end
        BrevoService.sync_contact(email: @contact.email, first_name: @contact.first_name, last_name: @contact.last_name)
      end

      redirect_to root_path(anchor: "newsletter"), notice: "Merci #{@contact.first_name}, votre message a bien été envoyé !"
    else
      redirect_to root_path(anchor: "newsletter"), alert: @contact.errors.full_messages.join(", ")
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone, :message, :newsletter_opt_in)
  end
end
